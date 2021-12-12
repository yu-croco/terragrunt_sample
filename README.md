# Terragrunt Sample
This is a small sample of terragrunt for describing dependent feature.

```
.
├── README.md
└── envs
    └── dev
        ├── iam
        ├── iam_policy // it depends on `iam` resources
        ├── provider.tf
        ├── terragrunt.hcl
        └── version.tf
```

## commands

```
# exec individually
$ cd envs/dev/${resource_name}
$ terragrunt ${init|plan|apply|destroy}

# exec to all resource
$ terragrunt run-all ${init|plan|apply|destroy}

# show dependencies
$ terragrunt graph-dependencies
# below is shown
# digraph {
# 	"iam" ;
# 	"iam_policy" ;
# 	"iam_policy" -> "iam";
# }
```

# References
- [TerragruntでTerraformのbackend周りのコードをDRYにする](https://dev.classmethod.jp/articles/terragrunt-makes-your-terraform-backend-code-dry/)
- [Terragruntを使って、複数のTerraformモジュールの操作を1回のコマンド実行で行う](https://kazuhira-r.hatenablog.com/entry/2021/02/27/170041)
- [Terragrunt Documentation](https://terragrunt.gruntwork.io/docs/)
