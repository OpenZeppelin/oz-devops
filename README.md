# OpenZeppelin devops repository (_oz-devops_)

[![standard-readme compliant](https://img.shields.io/badge/readme%20style-standard-brightgreen.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)

> Repository for OpenZeppelin devops scripts

Repository for devops scripts for the OpenZeppelin servers and services.
Currently, only DNS is managed by these scripts, using [terraform](https://www.terraform.io).

# Install

[Download the terraform binary](https://www.terraform.io/downloads.html).

Clone the repository and enter the dns repository:

```
git clone git@github.com:OpenZeppelin/oz-devops
cd oz-devops/dns
```

Write your AWS credetials to `~/.aws/credentials`:

```
[default]
aws_access_key_id = $id
aws_secret_access_key = $secret
```

Initialize terraform:

```
terraform init
```

## Usage

To apply changes, run:

```
terraform apply
```

## Maintainers

[elopio](https://github.com/elopio) and [spalladino](https://github.com/spalladino).

## License

All OpenZeppelin devops scripts are released under the [MIT License](LICENSE).

---

Made with :sleeping: by the OpenZeppelin team.
Check our fancier projects and services at https://openzeppelin.com.
