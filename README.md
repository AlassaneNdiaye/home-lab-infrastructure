# home-lab-infrastructure

[![CircleCI](https://circleci.com/gh/AlassaneNdiaye/home-lab-infrastructure.svg?style=svg)](https://circleci.com/gh/AlassaneNdiaye/home-lab-infrastructure)

Scripts for setting up a full-featured cluster.

## Getting Started

### Prerequisites

* [Git](https://git-scm.com)

* [Python](https://www.python.org/)

### Installation

For installation, follow these steps.

Clone the repository.

```
git clone https://github.com/AlassaneNdiaye/home-lab-infrastructure.git
```

Install Ansible on a server of your choice.
While not mandatory, it is recommended to install Ansible on the root server since that facilitates installation.

```
home-lab-infrastructure/scripts/ansible/setup
```

Setup the root server using Ansible. Destination where the server will be installed can be configured in the
[inventory file](scripts/inventory).
By default, the root server is installed on the local machine.

```
ansible-playbook home-lab-infrastructure/scripts/root-server/setup.yaml -i home-lab-infrastructure/scripts/inventory
```

The root server is now setup. Run the following command from the root server to verify the cluster is up.

 ```
kubectl cluster-info
```

### Configuration

Installation can be customized using the
[configuration file](scripts/group_vars/all/user-input).

## Tests

To make sure the cluster is fully functional, automated tests are available.

To run the tests, you need to install the test-containers library as shown
[here](https://github.com/AlassaneNdiaye/test-containers).
Once installed, run the tests with:

```
python -m test_containers --config home-lab-infrastructure/tests/tests.yaml
```

## Features

* Installation of Ansible.

* Installation of AWX.

* Installation of Docker.

* Setup of a Kubernetes cluster.

    * Automatic provisioning of the cluster with applications like a dashboard for managing the cluster,
      a cluster-wide resource usage aggregator and more.

* Network boot.

    * Automatic deployment of a DHCP server.

        * IP ranges and more can be customized with the `dhcp-conf` ConfigMap.

    * Automatic deployment of a PXE server.

        * Boot menu and more can be customized with the `pxe-conf` ConfigMap.

    * Automatic deployment of a web server with installation files for operating systems (Ubuntu, CentOS, etc).

        * Additional installation files can be mounted on the web server
          in order to increase the number of available operating systems.

    * Completely automated installation of operating systems (Ubuntu, CentOS, etc) from the network.

        * Installation files are fetched from the local network rather than from the web.

        * Automatic setup of system languages, timezones, users and more.
        
        * Automated installation procedures can be customized using the `os-web-server-conf` ConfigMap.

        * SSH keys can be provisioned automatically to the installed operating systems.

## Authors

* **Alassane Ndiaye** - [AlassaneNdiaye](https://github.com/AlassaneNdiaye)

## License

This project is licensed under the GNU General Public License v3.0 -
see the [LICENSE.txt](LICENSE.txt) file for details.
