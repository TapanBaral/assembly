process assembly {
    // Define parameters for number of threads and memory
    container  params.dockerfile
    
    publishDir "${params.output}/assembly", mode: "copy"
    cpus  params.cpu
    memory  10
    input:
    path configFile
    output:
    path "assembly_denovo/*", emit: assembly_output
    script:
    """
    mkdir assembly_denovo
    
    soapdenovo2-63mer all -s ${configFile} -o assembly_denovo/output127 -K 63 -p $task.cpus -a 700 -N 500000000 -V
    """
}
