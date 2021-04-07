# Set environment.
export MW_HOME='{{ oracle_base }}'
export WLS_HOME=$MW_HOME/wlserver
export WL_HOME=$WLS_HOME
export JAVA_HOME=/usr/local/jdk1.8.0_91
export PATH=$JAVA_HOME/bin:$PATH
#export DOMAIN_HOME=/application/Oracle/Middleware/Oracle_Home/user_projects/domains/ecaf_domain/

#. $DOMAIN_HOME/bin/setDomainEnv.sh
. "{{ oracle_base }}/wlserver/server/bin/setWLSEnv.sh"
# Create the cluster.
java weblogic.WLST /tmp/weblogic/domain_with_node.py -p /tmp/weblogic/domain.properties

