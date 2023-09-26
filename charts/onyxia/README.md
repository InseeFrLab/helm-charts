> 🛑 DEPRECATED: The Onyxia Chart is now hosted [here](https://github.com/InseeFrLab/onyxia/tree/main/helm-chart).  
> Checkout [the migration guide](https://docs.onyxia.sh/migration-guides/migrating-to-the-new-helm-repo). 

# Helm chart for [Onyxia](https://www.onyxia.sh/)  

## Breaking changes  

### v3 to v4  

* `ui` block has been renamed to `web` in the values. Change your `values.yaml` file accordingly.  
* Any resource created by helm that was suffixed by `ui` is now suffixed by `web`. This should be seamless for you unless you specifically rely on resource name for other purposes.  
* `image.name` has been renamed to `image.repository` and `image.version` has been renamed to `image.tag` to be more standard. If you are overriding versions in either web or API you should use those new values keys.

