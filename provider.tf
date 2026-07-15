provider "aws"{
    region  "us-east-2"
    AWS_ACCESS_KEY : ${{secret.AWS_ACCESS_KEY}}
    AWS_SECRET_ACCESS_KEY : ${{secret.AWS_SECRET_ACCESS_KEY}}
}
