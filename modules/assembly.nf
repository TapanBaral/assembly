process assembly {
    // Define parameters for number of threads and memory
    container  params.dockerfile
    
    publishDir "${params.output}/assembly", mode: "copy"
    cpus  params.cpu
    memory  params.memory
    input:
    path configFile
    output:
    path "assembly_denovo/*", emit: assembly_output
    script:
    """
    mkdir assembly_denovo
    
    soapdenovo2-63mer all -s ${configFile} -o assembly_denovo/output127 -K 63 -p $task.cpus -a $task.memory -N 500000000 -V
    """
}
