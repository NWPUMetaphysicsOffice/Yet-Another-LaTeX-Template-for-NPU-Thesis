# Yet Another NPU Thesis Template

![Poster](poster.png)

![Status](https://img.shields.io/badge/status-complete-brightgreen.svg)
![Version](https://img.shields.io/badge/version-v1.6.0.0214-674EA7.svg)
[![License](https://img.shields.io/badge/license-GNU_General_Public_License_v3.0-blue.svg)](LICENSE)

![Support-PhD--Thesis](https://img.shields.io/badge/Support-PhD--Thesis-D11A2D.svg)
![Support-Master--Thesis](https://img.shields.io/badge/Support-Master--Thesis-1177B0.svg)
![TeXLive2021](https://img.shields.io/badge/TeXLive-2021-3D6117.svg)

[![](https://img.shields.io/github/last-commit/NWPUMetaphysicsOffice/Yet-Another-LaTeX-Template-for-NPU-Thesis)](https://github.com/NWPUMetaphysicsOffice/Yet-Another-LaTeX-Template-for-NPU-Thesis/zipball/master)
[![](https://img.shields.io/github/issues/NWPUMetaphysicsOffice/Yet-Another-LaTeX-Template-for-NPU-Thesis)](https://github.com/x-magus/Yet-Another-LaTeX-Template-for-NPU-Thesis/issues)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4159248.svg)](https://doi.org/10.5281/zenodo.4159248)

这是在西北工业大学硕博研究生毕业设计论文格式的要求下的一份 LaTeX 文档类型模板。使用者无需修改导言区文档类型，直接在发布版的基础上，修改章节标题，撰写内容，即可完成毕业设计论文任务。

本 repo 主要基于开源库 [polossk/LaTeX-Template-For-NPU-Thesis](https://github.com/polossk/LaTeX-Template-For-NPU-Thesis) 之上修改而成，格式参照于 2014 年西北工业大学研究生院编写的[西北工业大学博士研究生学位论文编写规则（试用版）](http://gs.nwpu.edu.cn/info/1143/1139.htm)。

## 使用说明

1. 下载这个项目的 zip 包到到本地
2. 直接对 `document.tex` 文件进行修改，对应的摘要、章节内容、附录文件均已经默认生成，在此基础上加以修改即可
3. 如有必要，也可以请仿照 `document.tex` 在**导言区**引用 `\input{settings/thesis-setting}` 来直接设置文档格式
4. 如有必要，修改 `makefile` 文件的 `MAIN` 选项为自己 `tex` 文档的文件名
5. *make & Enjoy*

## 注意事项以及常见问题

* **博士学位论文 or 硕士学位论文？**
  * 本模版默认为博士学位论文，并且兼容硕士学位论文，但是不兼容本科毕业设计论文。
  * 硕士如需使用，请使用编辑器搜索 `% 硕士请修改此处` 注释标志，并修改“博士”文本为“硕士”即可。
  * 本科毕业设计论文请直接使用 [polossk/LaTeX-Template-For-NPU-Thesis](https://github.com/polossk/LaTeX-Template-For-NPU-Thesis) 模板，使用方式和本模板类似，不再赘述。
* **字体问题**
  * 本模板使用的是 **Windows** 系统的自带字体（宋体、黑体、楷体、仿宋、Times New Roman、Consolas），Windows 环境下目前能保证字体的指向正确。
  * 本模板目前兼容 macOS 用户。请在编译的时候添加 `-shell-escape` 选项，以保证模板正确识别操作系统。若字体出现异常，在字体册应用中查看对应字体的英文名字（与 Windows 下的英文名字不同）后，请在 `settings/thesis-setting.tex` 中替换 **macOS** 环境下的字体即可。若出现故障，请发 issue 联系开发者团队以便修改相关配置，以帮助更多的 macOS 用户。
  * 关于 macOS 用户的**黑体**解决方案
    * 非 Windows 操作系统的用户并没有取得 Windows 上黑体字体 `SimHei` 字体的授权，但是文章送审时你的评委老师的电脑极有可能是 Windows 的，但是其他黑体的表现（比如 macOS 自带的华文黑体系列）就会很奇怪（字体很挤、字重不统一等）。如果是面向送审，推荐从 Windows 上拷贝一整套字体（宋黑楷仿宋）然后将 `\ifmacosx` 后面的字体配置与 Windows 一致即可。
    * 如果你觉得 Windows 上的字体也很丑不够美观，可以自行更换为其他开源或商用字体。比如开源的[思源宋体](https://github.com/adobe-fonts/source-han-serif)、[思源黑体](https://github.com/adobe-fonts/source-han-serif)，然后更新对应操作系统的字体配置。
    * 请注意，如果你的文章会被收录或者其他商业用途，建议使用开源字体或默认操作系统字体，以免不必要的麻烦。
  * 关于缺失等宽字体（默认 Consolas）的解决方案
    * 非 Windows 操作系统的用户（包括 macOS 与 Linux 用户）需要安装 Consolas 字体后使用，字体文件存放于 `fonts/` 文件夹中。
    * 如果有其他字体的需求，也可以自行更改 `settings/thesis-setting.tex` 中对应操作系统下的 `\newcommand\codeFont{Consolas}` 为其他字体，例如修改为 `\newcommand\codeFont{Source Code Pro}` 以使用 `Source Code Pro` 字体。
  * Linux用户请自行检查修改 `settings/thesis-setting.tex` 中的Linux字体配置
  * 其他用户（例如 Cygwin ）请发 issue 以获得帮助，或者注释掉 `\ifwindows` 之后的关于跨平台的字体控制代码，直接修改上方已经被注释掉的 `MAYDAY!` 字体配置。
* **`makefile` 问题**
  * 本模板提供了简单的 `makefile` 文件来控制编译流程。
  * 默认流程为关闭当前已打开的输出 pdf 文件并删除，清理缓存文件，编译 tex 文档并打开。
  * 这份 `makefile` 提供了 `tex`（默认） 和 `nobib` 两种编译选项，后者不处理参考文献目录。
  * 同时提供了 `open`, `close`, `clean`, `wipe` 四个快捷指令，其效果如下：
    * `open`：使用 Acrobat 打开输出的 pdf 文件；
    * `close`：终止 Acrobat 进程从而关闭输出的 pdf 文件（会误伤其他以打开的文件）；
    * `clean`：删除 `*.aux` 和其他缓存文件；
    * `wipe`：删除输出的 pdf 文件；
  * 对于 Linux 玩家而言，可参考上述功能，并在此 `makefile` 基础上稍作修改即可使用。
* **预创建文件**
  * 以下文件按照实际论文中出现顺序排序

  |       |                    展示                     |                       展示                        |
  | :---: | :-----------------------------------------: | :-----------------------------------------------: |
  | 预览  |     ![coverpage](preview/coverpage.png)     |    ![frontpage_chs](preview/frontpage_chs.png)    |
  | 说明  |              封面页（外封面）               |            中文标题页（题名页/内封面）            |
  | 目录  |                `frontmatter`                |                   `frontmatter`                   |
  | 文件  |               `coverpage.tex`               |                `frontpage_chs.tex`                |
  | 预览  | ![frontpage_eng](preview/frontpage_eng.png) |     ![abstract_chs](preview/abstract_chs.png)     |
  | 说明  |                 英文标题页                  |                     中文摘要                      |
  | 目录  |                `frontmatter`                |                   `frontmatter`                   |
  | 文件  |             `frontpage_eng.tex`             |                `abstract_chs.tex`                 |
  | 预览  |  ![abstract_eng](preview/abstract_eng.png)  |       ![references](preview/references.png)       |
  | 说明  |                  英文摘要                   |                     参考文献                      |
  | 目录  |                `frontmatter`                |                   `references`                    |
  | 文件  |             `abstract_eng.tex`              |                  `reference.bib`                  |
  | 预览  |      ![appendix](preview/appendix.png)      | ![acknowledgements](preview/acknowledgements.png) |
  | 说明  |                    附录                     |                       致谢                        |
  | 目录  |                `backmatter`                 |                   `backmatter`                    |
  | 文件  |               `appendix.tex`                |              `acknowledgements.tex`               |
  | 预览  |        ![mywork](preview/mywork.png)        |        ![statement](preview/statement.png)        |
  | 说明  |        发表的学术论文和参加科研情况         |                    原创性声明                     |
  | 目录  |                `backmatter`                 |                   `backmatter`                    |
  | 文件  |                `mywork.tex`                 |                  `statement.tex`                  |
* **格式符说明**
  * 字体大小（size）的控制命令统一前缀为 `s`
  * 字体格式（font）的控制命令统一前缀为 `f`
* **开源许可问题**
  * 基于 [GPLv3-LICENSE](LICENSE)
  * 如有帮助，请在自己的文章中引用；如果在此基础上新增/删除/更改，请按照开源许可的要求继续保持开源，且同时继续使用相同开源许可
* **其他可能的模板使用问题**
  * 在编译过程中，如果遇到卡在字体缓冲问题，请先关闭当前进程，并用管理员模式打开命令提示符（或终端），键入 `fc-cache -f -v` 强制刷新字体缓存即可
  * 模板成型于 **2019 年**。如果后期有任何格式上的变化，欢迎 *fork-modify-pull-request* 或者在 [issue](hhttps://github.com/NWPUMetaphysicsOffice/Yet-Another-LaTeX-Template-for-NPU-Thesis/issues) 中详细说明新旧格式之差异，我们乐意解决模板使用的问题
  * **恕制作者们不解答任何 LaTeX 使用问题**

## BibTeX

```bibtex
@software{NWPUThesisLaTeXTemplate,
    title       = {Yet Another {{\LaTeX}} Template for NPU Thesis},
    author      = {Shangkun Shen and Zhihe Wang and Jiduo Zhang and Weijia Zhang},
    month       = {11},
    year        = {2019},
    publisher   = {Zenodo},
    journal     = {GitHub repository},
    doi         = {10.5281/zenodo.4159248},
    url         = {https://doi.org/10.5281/zenodo.4159248}
}
```

## Copyright

Use this code whatever you want, under the circumstances of acknowleged the
GPL license this page below. Star this repository if you like, and it will
be very generous of you!

## License

Copyright (c) 2016-2022 *NWPU Metaphysics Office* <https://github.com/NWPUMetaphysicsOffice>

This repo is under the license of **GNU General Public License v3.0**. Check [license](LICENSE) for details.

The association *NWPU Metaphysics Office* is a club-like student group. The
members are cfrpg, kidozh, njzwj, polossk, in alphabet order.

## 彩蛋

* ![Support-PhD--Thesis](https://img.shields.io/badge/Support-PhD--Thesis-D11A2D.svg) ![Support-Master--Thesis](https://img.shields.io/badge/Support-Master--Thesis-1177B0.svg) 分别对应着博士服与硕士服的颜色。
