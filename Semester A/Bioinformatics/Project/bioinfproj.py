import os
import subprocess as sp

input_sra_path = "./"
genome_index_path = "./"

NEW_FOLDERS = ['output_sam_folder', 'output_bam_folder']


def fastq_dump(srafiles, input_fastq_path):
    for srafile in srafiles:
        input_file = os.path.join(input_fastq_path, srafile)
        command = f"fastq-dump {input_file} -O {input_fastq_path}"
        sp.run(command, shell= True, check= True)

def create_folders(input_fastq_path):
    for folder_name in NEW_FOLDERS:
        new_folder_path = os.path.join(input_fastq_path, folder_name)
        os.makedirs(new_folder_path, exist_ok=True)

def align_bowtie(trimmed_files, output_trimmed_fastq, output_sam_folder, genome_index_path):
    trimdict = {}
    for trimmed_file in trimmed_files:
        trimname = trimmed_file.strip().split("_")[0]
        if trimname in trimdict:
            trimdict[trimname].append(trimmed_file)
        else:
            trimname = trimmed_file.strip().split(".")[0]
            trimdict[trimname] = [trimmed_file]
    for trimname, trimmed_file_pair in trimdict.items():
        if len(trimmed_file_pair) == 2:
            input_trimmed_path = os.path.join(output_trimmed_fastq, trimmed_file_pair[0])
            input_trimmed_path2 = os.path.join(output_trimmed_fastq, trimmed_file_pair[1])
            output_sam_path = os.path.join(output_sam_folder, f"{trimname}.sam")
            cmd = f"bowtie -p 6 -m 1 -x {genome_index_path} -S -1 {input_trimmed_path} -2 {input_trimmed_path2} > {output_sam_path}"
            sp.run(cmd, shell=True, check=True)
        if not trimmed_file_pair[0].__contains__('_1') and not trimmed_file_pair[0].__contains__('_2'):
            input_trimmed_path = os.path.join(output_trimmed_fastq, trimmed_file_pair[0])
            output_sam_path = os.path.join(output_sam_folder, f"{trimname}.sam")
            # run bowtie2 to align the reads to the genome
            command = f"bowtie -p 6 -m 1 -x {genome_index_path} -S {input_trimmed_path} > {output_sam_path}"
            sp.run(command, shell=True, check=True)

def samtools_sam2bam(sam_files, output_sam_folder, output_bam_folder):
    for sam_file in sam_files:
        input_sam_file = os.path.join(output_sam_folder, sam_file)
        output_bam_file = os.path.join(output_bam_folder, f"{sam_file.replace('.sam', '.bam')}")
        output_sorted_bam_file = os.path.join(output_bam_folder, f"{output_bam_file.replace('.bam', '_sorted.bam')}")
        command = f"samtools view -b -o {output_bam_file} {input_sam_file}"
        sp.run(command, shell=True, check=True)
        remsam = f"rm {input_sam_file}"
        sp.run(remsam, shell=True, check=True)
        sort_command = f"samtools sort {output_bam_file} -o {output_sorted_bam_file}"
        sp.run(sort_command, shell=True, check=True)
        index = f"samtools index {output_sorted_bam_file}"
        sp.run(index, shell=True, check=True)
        bedgraph = f"bedtools genomecov -bg -ibam {output_sorted_bam_file} -g {genome_index_path +".chrom.sizes"} > {output_sorted_bam_file.replace('.bam','.bdg')}"
        sp.run(bedgraph, shell=True, check=True)
        bdg2bw = f"bedGraphToBigWig {output_sorted_bam_file.replace('.bam','.bdg')} {genome_index_path+".chrom.sizes"} {output_sorted_bam_file.replace('.bam','.bw')}"
        sp.run(bdg2bw, shell=True, check=True)

def macsp3(final_bam_files, output_bam_folder):
    for final_bam_file in final_bam_files:
        input_file = os.path.join(output_bam_folder, final_bam_file)
        name = input_file.split('.')[0]
        control = "SRR524939_sorted.bam"
        macs_cmd = f"macs -t {input_file} --format=BAM --name={name} --gsize=138000000 --tsize=26 --diag --wig -c {control}"
        sp.run(macs_cmd, shell=True, check=True)

def motif_finder(peak_files, output_bam_folder):
    for summit_file in peak_files:
        input_file = os.path.join(output_bam_folder, summit_file)
        name = input_file.split('.')[0]
        slop = f"bedtools slop -i {summit_file} -g {genome_index_path+".chrom.sizes"} -b 20 > {name}_b20.bed"
        sp.run(slop, shell=True, check=True)
        fastabed = f"bedtools getfasta -fi {genome_index_path+".fa"} -bed {name}_b20.bed -fo {name}_b20.fa"
        sp.run(fastabed, shell=True, check=True)
        meme = f"meme {name+'_b20.fa'}  -o meme_{name.split('/')[-1].split('_')[0]} -dna"
        sp.run(meme, shell=True, check=True)

def main(input_fastq_path, genome_index_path):
    create_folders(input_fastq_path)
    srafiles = [srafile for srafile in os.listdir(input_fastq_path) if srafile.endswith('.sra') and not srafile.startswith('._')]
    fastq_dump(srafiles, input_fastq_path)
    files = [file for file in os.listdir(input_fastq_path) if file.endswith(".fastq") and not file.startswith("._")]
    align_bowtie(files, input_fastq_path, os.path.join(input_fastq_path, NEW_FOLDERS[0]), genome_index_path)
    sam_files = [sam_file for sam_file in os.listdir(os.path.join(input_fastq_path, NEW_FOLDERS[0])) if sam_file.endswith(".sam") and not sam_file.startswith("._")]
    samtools_sam2bam(sam_files, os.path.join(input_fastq_path, NEW_FOLDERS[0]), os.path.join(input_fastq_path, NEW_FOLDERS[1]))
    bam_files = [bam_file for bam_file in os.listdir(os.path.join(input_fastq_path, NEW_FOLDERS[1])) if bam_file.endswith(".bam") and not bam_file.startswith("._")]
    macsp3(bam_files, os.path.join(input_fastq_path, NEW_FOLDERS[1]))
    peak_files = [peak_file for peak_file in os.listdir(os.path.join(input_fastq_path, NEW_FOLDERS[1])) if peak_file.endswith('_summits.bed') and not peak_file.startswith('._')]
    motif_finder(peak_files, os.path.join(input_fastq_path, NEW_FOLDERS[1]))


if __name__ == "__main__":
    main(input_sra_path, genome_index_path)
