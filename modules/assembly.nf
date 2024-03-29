process assembly {
    // Define parameters for number of threads and memory
    container  params.dockerfile
    
    publishDir "${params.output}/assembly", mode: "copy"
    cpu = 96
    memory = 800
    input:
    path fastq_1
    path fastq_2
    path configFile
    output:
    path "assembly_denovo/*", emit: assembly_output
    script:
    """
    mkdir assembly_denovo
    configFile = configFile.read().text
    soapdenovo2-127mer all -s <(echo "$configFile") -o assembly_denovo/output127 -K 127 -p $task.cpus -a 800 
    """
}
