// Import the assembly module
include { assembly } from './module/assembly'




// Check if both fastq_1 and fastq_2 are provided
    if (!params.fastq_1 && !params.fastq_2) {
        exit 1, "Neither --fastq_1 nor --fastq_2 are provided!"
    } else if (params.fastq_1 && !params.fastq_2) {
        exit 1, "Please provide --fastq_2"
    } else if (!params.fastq_1 && params.fastq_2) {
        exit 1, "Please provide --fastq_1"
    } else if (params.fastq_1 && params.fastq_2) {
        // Define input channels using Channel.fromPath
        Channel.fromPath(params.fastq_1).set { fastq_1_ch }
        Channel.fromPath(params.fastq_2).set { fastq_2_ch }
    }
    configFile_ch  = Channel.fromPath(params.config_file)


workflow {
    if (params.fastq_1 && params.fastq_2) {

       assembly(fastq_1_ch, fastq_2_ch, configFile_ch)
       assembly.out.spades_output.view()
    }
}
