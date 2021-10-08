#Credenciais de acesso para AWS de Develop

provider "aws" {
  region = "var.region"
  shared_credentials_file = "~/.aws/credentials"
  profile = "var.profile"
}