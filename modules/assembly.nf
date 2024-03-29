process assembly {
    // Define parameters for number of threads and memory
    container  params.dockerfile
    
    publishDir "${params.output}/assembly", mode: "copy"
    cpu = 96
    memory = 800.G
    input:
    path fastq_1
    path fastq_2
    path configFile
    output:
    path "assembly_denovo/*", emit: assembly_output
    script:
    """
    mkdir assembly_denovo
    soapdenovo2-127mer all -c $configFile -o assembly_denovo -K 127 -p $task.cpus -a 900 
    """
}
