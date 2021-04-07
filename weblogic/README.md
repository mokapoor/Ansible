
Editor.md

Open source online Markdown editor.

​

Weblogic 12C

=========

​

Ansible role to install and configure Oracle Weblogic Server 12C.

​

Requirements

------------

​

1. Download oracle weblogic installers from https://www.oracle.com/middleware/technologies/weblogic-server-installers-downloads.html

2. Download JDK from https://www.oracle.com/in/java/technologies/javase/javase8-archive-downloads.html

​

Role Tasks

--------------

​

- packages_mod_v1.yml -> Required libraries/packages

- java_setup_v1.yml   -> Java setup and configuration 

- installer_v1.yml    -> Weblogic 12C silent installation

- domain_config.yml   -> Domain, node and cluster configuration 

- node_manager.yml    -> Nodemanager property configuration

- admin_server.yml    -> boot.property configuration for without password startup

​

Role Variables

--------------

​

User need to modify below two variable file as per requirement.

1. user_vars.yml

2. domain.properties

​

User_vars - Content

-------------------

​

**#User and group configuration**

oracle_user: 'web_user'

oracle_group: 'web_user'

​

**#Software and configuration main directory**

oracle_base: '/data/Oracle/Middleware/Oracle_Home'

Weblogic 12C

Ansible role to install and configure Oracle Weblogic Server 12C.
Requirements

    Download oracle weblogic installers from https://www.oracle.com/middleware/technologies/weblogic-server-installers-downloads.html
    Download JDK from https://www.oracle.com/in/java/technologies/javase/javase8-archive-downloads.html

Role Tasks

    packages_mod_v1.yml -> Required libraries/packages
    java_setup_v1.yml -> Java setup and configuration
    installer_v1.yml -> Weblogic 12C silent installation
    domain_config.yml -> Domain, node and cluster configuration
    node_manager.yml -> Nodemanager property configuration
    admin_server.yml -> boot.property configuration for without password startup

Role Variables

User need to modify below two variable file as per requirement.

    user_vars.yml
    domain.properties

User_vars - Content

#User and group configuration
oracle_user: ‘web_user’
oracle_group: ‘web_user’

#Software and configuration main directory
oracle_base: ‘/data/Oracle/Middleware/Oracle_Home’

#JDK installer and target folder
jdk_installation_archive: ‘jdk-8u91-linux-x64.tar.gz’
jdk_installation_dir: ‘/usr/local/‘
jdk_folder: ‘/usr/local/jdk1.8.0_91’

#fmw installer
mw_installer: ‘fmw_12.2.1.0.0_wls.jar’

#Domain Name
domain_name: ‘dirs_domain’

#Nodemanager and server settings
node_manager_listen_port: ‘5556’
node_manager_listen_address: ‘admin server ip address’ #like 192.168.1.100
admin_server_hostname: ‘admin server ip address’ #like 192.168.1.100
weblogic_admin: ‘weblogic’
weblogic_pass: ‘password’ #like weblogic@123
Domain.properties -Content

#Paths
mwhome={{ oracle_base }}
wlshome={{ weblogic_home }}
domainroot={{ domains_home }}
approot={{ oracle_base }}

#Credentials
domain_name=dirs_domain
domain_username=weblogic
domain_password= ‘password’ #like weblogic@123

#Admin Server
admin.port=7003
admin.address= ‘admin server ip address’ #like 192.168.1.100

#Managed Server Definition
#Add more ms based on your need
#for every ms(server) you are adding you should also specify the properties like ms[n].port etc
managedservers=ms1
#No need to change managed servers value ms1 as it use as a variable
ms1.Name=MS_1
ms1.port=7005
ms1.address=192.168.191.130

#Cluster Definition
clusters=c1
#No need to change clusters value c1 as it use as a variable
c1.Name=POST
c1.members=ms1
#Define Machines
machines=m1
m1.Name=post_machine
m1.instances=ms1
Dependencies

Java
Example Playbook

    name: weblogic playbook
    hosts: remote
    gather_facts: yes
    vars_files:
        roles/weblogic/group_vars/application_vars.yml
        roles/weblogic/group_vars/user_vars.yml
        roles:
        weblogic

Example

<link rel="stylesheet" href="editormd/css/editormd.css" />
<div id="test-editor">
    <textarea style="display:none;">### Editor.md

**Editor.md**: The open source embeddable online markdown editor, based on CodeMirror & jQuery & Marked.
    </textarea>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="editormd/editormd.min.js"></script>
<script type="text/javascript">
    $(function() {
        var editor = editormd("test-editor", {
            // width  : "100%",
            // height : "100%",
            path   : "editormd/lib/"
        });
    });
</script>

Copy

More Examples >>
Features

    Support Standard Markdown / CommonMark and GFM(GitHub Flavored Markdown);
    Full-featured: Real-time Preview, Image (cross-domain) upload, Preformatted text/Code blocks/Tables insert, Code fold, Search replace, Read only, Themes, Multi-languages, L18n, HTML entities, Code syntax highlighting...;
    Markdown Extras : Support ToC (Table of Contents), Emoji, Task lists, @Links...;
    Support TeX (LaTeX expressions, Based on KaTeX), Flowchart and Sequence Diagram of Markdown extended syntax;
    Support identification, interpretation, fliter of the HTML tags;
    Support AMD/CMD (Require.js & Sea.js) Module Loader, and Custom/define editor plugins;
    Compatible with all major browsers (IE8+), compatible Zepto.js and iPad;
    Support Custom theme styles;

Download & install

Latest version: v1.5.0，Update: 2015-06-09



Or NPM install:

npm install editor.md

Or Bower install:

bower install editor.md


Change logs:

CHANGES
Dependents

Projects :

    CodeMirror
    marked
    jQuery
    FontAwesome
    github-markdown.css
    KaTeX
    Rephael.js
    prettify.js
    flowchart.js
    sequence-diagram.js
    Prefixes.scss


Development tools :

    Visual Studio Code
    Sass/Scss
    Gulp.js

License

Editor.md follows the MIT License, Anyone can freely use.

Fork me on Github :

Users


Contact Us: editor.md@ipandao.com

Editor.md

Copyright © 2015-2019 Editor.md, MIT license.

Design & Develop By: Pandao   
