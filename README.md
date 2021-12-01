# graceful-sidecar

You are running a job on K8s that uses a side car container. Maybe this is the [Google Cloud SQL Auth Proxy](https://cloud.google.com/sql/docs/mysql/connect-kubernetes-engine). After your job finishes, it stays active because the side car doesn't know it should exit. Your job never cleans up and you have to manually exit.

<br>
<p align="center" width="100%">
    <img width="33%" src="https://user-images.githubusercontent.com/6175788/144174743-52c73a5f-3bc8-4f73-97e5-5b75f04cf67c.gif"> 
</p>

