# Hashicorp Terraform

## Documentation

* <https://www.terraform.io/docs/index.html>

## Terraform References

* <https://www.terraform.io/docs/language/modules/develop/structure.html>
* <https://cloudcasts.io/course/terraform/environment-directories>
* <https://github.com/hashicorp/terraform>
* <https://www.digitalocean.com/community/tutorials/how-to-structure-a-terraform-project>

## Certification (Associate)

All Documentation and link to certification guide.

* <https://www.hashicorp.com/certification/terraform-associate>

## Sparse GIT clone

This is to checkout only what you need.

* <https://git-scm.com/docs/git-clone>
* <https://git-scm.com/docs/git-sparse-checkout>

### Step 1

The steps to do a sparse clone are as follows.

```BASH
mkdir <repo>
cd <repo>
git init
git remote add -f origin <url>
```

This creates an empty repository with your remote, and fetches all objects but doesn't check them out.

### Step 2

Set the sparse checkout config in this GIT repo:

```BASH
git config core.sparseCheckout true
```

### Step 3

Now you need to define which files/folders you want to actually check out. This is done by listing them in .git/info/sparse-checkout, eg:

```BASH
echo "some/dir/" >> .git/info/sparse-checkout
echo "another/sub/tree" >> .git/info/sparse-checkout
```

### Step 4

Last but not least, update your empty repo with the state from the remote:

```BASH
git pull origin master
```

### Done

You will now have files "checked out" for some/dir and another/sub/tree on your file system (with those paths still), and no other paths present.

You might want to have a look at the extended tutorial and you should probably read the official documentation for sparse checkout and read-tree.

### As A Function

```SH
function git_sparse_clone() (
  rurl="$1" localdir="$2" && shift 2

  mkdir -p "$localdir"
  cd "$localdir"

  git init
  git remote add -f origin "$rurl"

  git config core.sparseCheckout true

  # Loops over remaining args
  for i; do
    echo "$i" >> .git/info/sparse-checkout
  done

  git pull origin master
)
```

```BASH
git_sparse_clone "http://github.com/tj/n" "./local/location" "/bin"
```

### Notes

Note that this will still download the whole repository from the server – only the checkout is reduced in size. At the moment it is not possible to clone only a single directory. But if you don't need the history of the repository, you can at least save on bandwidth by creating a shallow clone. See udondan's answer below for information on how to combine shallow clone and sparse checkout.

As of git 2.25.0 (Jan 2020) an experimental sparse-checkout command is added in git:

```BASH
git sparse-checkout init
# same as: 
# git config core.sparseCheckout true

git sparse-checkout set "A/B"
# same as:
# echo "A/B" >> .git/info/sparse-checkout

git sparse-checkout list
# same as:
# cat .git/info/sparse-checkout
```

## Basic Gitignore for Terraform