#!/bin/sh

# Install crane if missing
if !(type "crane" > /dev/null 2>&1); then
  go install github.com/google/go-containerregistry/cmd/crane@latest
fi

TEST_IMAGE=ghcr.io/khulnasoft-lab/vul-test-images


cat <<EOS

#############################
Spring4Shell (CVE-2022-22965)
#############################

EOS

docker build --target jre11 -t ${TEST_IMAGE}:spring4shell-jre11 spring4shell
docker push ${TEST_IMAGE}:spring4shell-jre11
docker rmi -f ${TEST_IMAGE}:spring4shell-jre11

docker build --target jre8 -t ${TEST_IMAGE}:spring4shell-jre8 spring4shell
docker push ${TEST_IMAGE}:spring4shell-jre8
docker rmi -f ${TEST_IMAGE}:spring4shell-jre8


cat <<EOS

##########
containerd
##########

EOS

docker build -t ${TEST_IMAGE}/containerd:latest containerd
docker push ${TEST_IMAGE}/containerd:latest
docker rmi -f ${TEST_IMAGE}/containerd:latest


cat <<EOS

######################
almalinux:8.5-20211112
######################

EOS

crane copy almalinux ${TEST_IMAGE}:almalinux-8


cat <<EOS

############
alpine:3.9.4
############

EOS

crane copy alpine ${TEST_IMAGE}:alpine-39


cat <<EOS

#############
alpine:3.10.2
#############

EOS

crane copy alpine ${TEST_IMAGE}:alpine-310


cat <<EOS

###############################
ghcr.io/distroless/git:20220412
###############################

EOS

crane copy ghcr.io/distroless/git ${TEST_IMAGE}:alpine-distroless


cat <<EOS

####################
busybox + Cargo.lock
####################

EOS

docker build -t ${TEST_IMAGE}:busybox-with-lockfile busybox-with-lockfile
docker push ${TEST_IMAGE}:busybox-with-lockfile
docker rmi -f ${TEST_IMAGE}:busybox-with-lockfile


cat <<EOS

############################################
quay.io/fluentd_elasticsearch/fluentd:v2.9.0
############################################

EOS

crane copy quay.io/fluentd_elasticsearch/fluentd ${TEST_IMAGE}:fluentd-multiple-lockfiles


cat <<EOS

#########################################################
amazonlinux:2018.03.0.20190826 - Amazon Linux AMI 2018.03
#########################################################

EOS

crane copy amazonlinux ${TEST_IMAGE}:amazon-1


cat <<EOS

#########################################
amazonlinux:2.0.20190508 - Amazon Linux 2
#########################################

EOS

crane copy amazonlinux ${TEST_IMAGE}:amazon-2


cat <<EOS

########
centos:6
########

EOS

crane copy centos ${TEST_IMAGE}:centos-6


cat <<EOS

###############
centos:7.6.1810
###############

EOS

crane copy centos ${TEST_IMAGE}:centos-7


cat <<EOS

######################
debian:buster-20190910
######################

EOS

crane copy debian ${TEST_IMAGE}:debian-buster


cat <<EOS

#######################
debian:stretch-20190812
#######################

EOS

crane copy debian ${TEST_IMAGE}:debian-stretch


cat <<EOS

##############################################################################################
gcr.io/distroless/base
##############################################################################################

EOS 

crane copy gcr.io/distroless/base ${TEST_IMAGE}:distroless-base


cat <<EOS

###################################################################################################
gcr.io/distroless/python2.7
###################################################################################################

EOS

crane copy gcr.io/distroless/python2.7 ${TEST_IMAGE}:distroless-python27


cat <<EOS

#########
fedora:35
#########

EOS

crane copy fedora ${TEST_IMAGE}:fedora-35


cat <<EOS

############################################
cblmariner.azurecr.io/base/core:1.0.20220122
############################################

EOS

crane copy cblmariner.azurecr.io/base/core ${TEST_IMAGE}:mariner-1.0


cat <<EOS

#############################################
registry.opensuse.org/opensuse/leap:15.1.3.67
#############################################

EOS

crane copy registry.opensuse.org/opensuse/leap ${TEST_IMAGE}:opensuse-leap-151


cat <<EOS

###################
photon:3.0-20190823
###################

EOS

crane copy photon ${TEST_IMAGE}:photon-30


cat <<EOS

##############
rockylinux:8.5
##############

EOS

crane copy rockylinux ${TEST_IMAGE}:rockylinux-8


cat <<EOS

###########
ubi:7.7-140
###########

EOS

crane copy registry.access.redhat.com/ubi7/ubi ${TEST_IMAGE}:ubi-7


cat <<EOS

##########################################################
ubuntu:xenial-20190720 - Ubuntu 16.04.6 LTS (Xenial Xerus)
##########################################################

EOS

crane copy ubuntu ${TEST_IMAGE}:ubuntu-1604


cat <<EOS

####################################################
ubuntu:bionic-20190807 - 18.04.3 LTS (Bionic Beaver)
####################################################

EOS

crane copy ubuntu ${TEST_IMAGE}:ubuntu-1804


cat <<EOS

#####################################
vulnimage - khulnasoft-lab/vuln-image:1.2.3
#####################################

EOS

crane copy khulnasoft-lab/vuln-image ${TEST_IMAGE}:vulnimage


cat <<EOS

###############
oraclelinux:8.0
###############

EOS

crane copy oraclelinux ${TEST_IMAGE}:oraclelinux-8


cat <<EOS

##################################
suse-15.3: suse/sle15:15.3.17.8.16
##################################

EOS

crane copy registry.suse.com/suse/sle15 ${TEST_IMAGE}:suse-15.3_ndb