# microservice-consul-template
This project is mainly introduce:
1. How to build a distributed microservice system;
2. Automatic discovery and register microservice;
3. Automatic check the microservice status;
4. Make a clearly introduction of consul-template.

## Project Architecture 
![image](https://github.com/fasimito/microservice-consul-template/blob/master/images/arche.jpg)

registrator monitors the status of each service web. When a new service web is launched, the registrator registers it in the consul registry. Since consul_template has subscribed to the service message on the registry, the consul registry will push the new service web information to consul_template, and consul_template will modify the configuration file of nginx.conf, and then let nginx reload the configuration to automatically modify the load balance. Similarly, when a service web hangs up, the registrator can sense it and then notify consul to respond. 

The whole process is completed automatically without manual intervention of operation and maintenance. 

Consul-Template is an application that automatically replaces configuration files based on Consul. Before Consul-Template came into being, most of the service discovery systems we built were Zookeeper, Etcd + Confd. 
