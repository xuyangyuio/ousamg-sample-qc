#!/bin/bash

export NXF_DEFAULT_DSL=1
export CAPSULE_LOG=none
NXF_ANSI_LOG=false

uid=`uuidgen`
# sampleid="NA12878"
sampleid="NA12878"

nextflow run NPM-sample-qc/main.nf \
	-config NPM-sample-qc/conf/nextflow-docker.config \
	-params-file NPM-sample-qc/tests/sample_params.aws.bam.yml \
	-resume \
	--outdir output/${sampleid} \
	-bucket-dir output/${sampleid}-work \
	-profile awsbatch \
	-with-trace \
	-bg >nf-test.${uid}.log
