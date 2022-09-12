#!/bin/bash

export cicd_ns=cicd
export dev_ns=dev

echo "Configure service account permissions for pipeline"
oc policy add-role-to-user edit system:serviceaccount:$cicd_ns:pipeline -n $dev_ns
oc policy add-role-to-user system:image-puller system:serviceaccount:$dev_ns:default -n $cicd_ns