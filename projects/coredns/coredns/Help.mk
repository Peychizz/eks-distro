


########### DO NOT EDIT #############################
# To update call: make add-generated-help-block
# This is added to help document dynamic targets and support shell autocompletion


##@ GIT/Repo Targets
clone-repo:  ## Clone upstream `coredns`
checkout-repo: ## Checkout upstream tag based on value in GIT_TAG file

##@ Binary Targets
binaries: ## Build all binaries: `coredns` for `linux/amd64 linux/arm64`
_output/1-21/bin/coredns/linux-amd64/coredns: ## Build `_output/1-21/bin/coredns/linux-amd64/coredns`
_output/1-21/bin/coredns/linux-arm64/coredns: ## Build `_output/1-21/bin/coredns/linux-arm64/coredns`

##@ Image Targets
local-images: ## Builds `coredns/images/amd64` as oci tars for presumbit validation
images: ## Pushes `coredns/images/push coredns/images/amd64 coredns/images/arm64` to IMAGE_REPO
coredns/images/amd64: ## Builds/pushes `coredns/images/amd64`
coredns/images/push: ## Builds/pushes `coredns/images/push`
coredns/images/arm64: ## Builds/pushes `coredns/images/arm64`

##@ Checksum Targets
checksums: ## Update checksums file based on currently built binaries.
validate-checksums: # Validate checksums of currently built binaries against checksums file.

##@ Artifact Targets
tarballs: ## Create tarballs by calling build/lib/simple_create_tarballs.sh unless SIMPLE_CREATE_TARBALLS=false, then tarballs must be defined in project Makefile
s3-artifacts: # Prepare ARTIFACTS_PATH folder structure with tarballs/manifests/other items to be uploaded to s3
upload-artifacts: # Upload tarballs and other artifacts from ARTIFACTS_PATH to S3

##@ License Targets
gather-licenses: ## Helper to call $(GATHER_LICENSES_TARGETS) which gathers all licenses
attribution: ## Generates attribution from licenses gathered during `gather-licenses`.
attribution-pr: ## Generates PR to update attribution files for projects

##@ Clean Targets
clean: ## Removes source and _output directory
clean-repo: ## Removes source directory

##@ Helpers
help: ## Display this help
add-generated-help-block: ## Add or update generated help block to document project make file and support shell auto completion

##@ Build Targets
build: ## Called via prow presubmit, calls `validate-checksums local-images attribution upload-artifacts attribution-pr`
release: ## Called via prow postsubmit + release jobs, calls `validate-checksums images upload-artifacts`
########### END GENERATED ###########################
