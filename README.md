## JDConfigPrivatePod 

### Useage

**1.** Add  private pod repo  to your local. Run the`pod repo add JDConfigPrivatePod https://github.com/lyc59621/JDConfigPrivatePod.git `   and  `pod repo update --verbose` command  on the terminal. Make sure the private source has been added successfully.

**2.** Add the `upload.sh` to your pod project and make sure it is in the same directory as the `.podspec` file.
You can add this shell script file to .gitignore If you think it is necessary.

**3.**  Making the  version   in the `.podspec` file, such as change the `s.version = "0.0.1"` to `s.version = "0.0.2"`,

**4.**  Run the `./upload.sh` command on the terminal. It's will auto update your Pod project version and auto push it to origin. If failed, you have to check and make sure your `podspec` configuration is correct.


 
## 中文说明 


### 前提条件：

你的 Pod 组件必须是已经正确配置，且之前有过手动输命令行更新的经历。

### 怎么使用

**1.** 将pod repo 私有源地址添加到本地。在终端上运行`pod repo add JDConfigPrivatePod https://github.com/lyc59621/JDConfigPrivatePod.git `  和 `pod repo update --verbose `命令 确保私有源已经添加成功。

**2.** 将`upload.sh`文件拖入Pod组件工程中，并保证它与 podspec 文件处于同一级别的目录。

**3.** 在`.podspec`文件中创建版本，例如将s.version =“ 0.0.1”更改为`s.version =“ 0.0.2”，

**4.** 打开终端，cd 到这个脚本文件所在目录中，执行 `./upload.sh`，即可开始版本自动升级。如果你的 Pod 已经配置正确，并且之前有过手动输入指令进行升级的经历，那么脚本应该是能成功运行的。


## Author
lyc59621@icloud.com


## License

JDConfigPrivatePod is available under the MIT license. See the LICENSE file for more info.
