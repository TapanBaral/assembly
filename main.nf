// Import the assembly module
include { assembly } from './modules/assembly'




    configFile_ch  = Channel.fromPath(params.config_file)


workflow {
    if (params.fastq_1 && params.fastq_2) {

       assembly(configFile_ch)
       assembly.out.assembly_output.view()
    }
}
