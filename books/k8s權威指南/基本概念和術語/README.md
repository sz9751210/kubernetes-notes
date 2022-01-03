## 基本概念和術語
- 可將以下的組件都當成一種資源對象，大部分資源對象可透過kubectl進行CRUD並保存到etcd中持久化儲存
- 通過跟蹤比對etcd裡保存的`資源期望狀態`與當前環境中的`實際資源狀態`的差異來實現自動控制和自動修正的高級功能
- 大部分核心資源對象都歸屬於v1這個api，如有新特性大多會先添加在annotation，等新特性完全成熟則會更新到api
### Master
- 簡介：集群控制節點(首腦)，負責整個集群的管理和控制，api會從master接收，並負責具體執行過程
- 運行的關鍵進程：
  - Kubernetes API Server(Kube-apiserver)：提供http rest api，k8s裡所有資源CRUD操作入口，集群控制入口
  - Kubernetes Controller Manager(kube-controller-manager)：所有資源對象的自動化控制中心
  - Kubernetes Scheduler(kube-scheduler)：資源調度
  - etcd：資源對象持久化儲存

### Node
- 簡介：工作負載節點，受master分配工作，如node當機則會將此機器上的工作調度到其他node
- 運行的關鍵進程：
  - kubelet：負責Pod對應的容器創建、起停等任務
  - kube-proxy：與service組件通信以及實現負載均衡機制
  - Docker Engine：負責容器創建和管理工作
- 註冊到Master：默認情況，kubelet會向master註冊自己，註冊成功後，kubelet會定時向master回報自身狀態(操作系統，docker版本，機器cpu和meme情況)，當前有哪些pod在運作，藉此實現均衡資源調度策略，當某個node超過health check，會被master判定為失聯，node狀態會被標記為不可用，master則會觸發`工作負載轉移`的自動流程
### Pod
### Label
### Replication Controller
### Deployment
### Horizontal Pod Autoscaler
### StatefulSet
### Service
### Job
### Volume
### Persistent Volume
### Namespace
### Annotation
### ConfigMap