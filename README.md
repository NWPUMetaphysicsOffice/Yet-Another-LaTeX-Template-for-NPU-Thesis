# Yet Another NPU Thesis Template

![Poster][poster]

![Status](https://img.shields.io/badge/status-complete-brightgreen.svg) ![PhD-Thesis](https://img.shields.io/badge/PhD-Thesis-D11A2D.svg) ![Master-Thesis](https://img.shields.io/badge/Master-Thesis-1177B0.svg) ![TeX-Template](https://img.shields.io/badge/TeX-Template-3D6117.svg?style=flat-square) [![License](https://img.shields.io/badge/license-GNU_General_Public_License_v3.0-blue.svg)](LICENSE) ![Version](https://img.shields.io/badge/version-v1.8.5.0307-674EA7.svg)

![TeXLive>=2021](https://img.shields.io/badge/TeXLive-%3E=2021-3D6117.svg) [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4159248.svg)](https://doi.org/10.5281/zenodo.4159248) [![](https://img.shields.io/github/last-commit/NWPUMetaphysicsOffice/Yet-Another-LaTeX-Template-for-NPU-Thesis)](https://github.com/NWPUMetaphysicsOffice/Yet-Another-LaTeX-Template-for-NPU-Thesis/zipball/master) [![](https://img.shields.io/github/issues/NWPUMetaphysicsOffice/Yet-Another-LaTeX-Template-for-NPU-Thesis)](https://github.com/NWPUMetaphysicsOffice/Yet-Another-LaTeX-Template-for-NPU-Thesis/issues)

这是在西北工业大学硕博研究生学位论文格式的要求下的一份 $\LaTeX$ 文档类模板，通过使用 `yanputhesis` 文档类来完成学位论文，也可直接在发布示例文件的基础上，修改章节标题，撰写内容，即可完成学位论文任务。

本 repo 主要基于开源库 [polossk/LaTeX-Template-For-NPU-Thesis](https://github.com/polossk/LaTeX-Template-For-NPU-Thesis) 之上修改而成，格式参照于 2022 年西北工业大学研究生院编写的[西北工业大学研究生学位论文写作指南](https://gs.nwpu.edu.cn/info/2284/15346.htm)。

目前项目主要由 @polossk 维护，发布版本可能会有一些不影响阅读与送审的小问题。如果有相关格式更正需求，请发布 issue 催更，我们将对模板 bug 发布更新。

* master 分支，发布累积更新后的版本，当前版本 [v1.8.5](https://github.com/NWPUMetaphysicsOffice/Yet-Another-LaTeX-Template-for-NPU-Thesis/releases)
* polossk-dev 分支，由 @polossk 维护的开发分支，用于及时发布更新补丁，当前版本 v1.8.5.0307 [下载链接](https://github.com/NWPUMetaphysicsOffice/Yet-Another-LaTeX-Template-for-NPU-Thesis/archive/refs/heads/polossk-dev.zip)

## 使用说明

1. 下载这个项目的 zip 包到到本地
2. 确保您的 TeX 版本为**不低于 Texlive 2021 版本**
3. 直接对 `yanputhesis-sample.tex` 文件进行修改，对应的摘要、章节内容、附录文件均已经默认生成，在此基础上加以修改即可
4. 如有必要，也可以请仿照 `yanputhesis-sample.tex` 的文件格式，在**导言区**使用 `\documentclass[lang=chs, degree=phd, blindreview=false, adobe=false]{yanputhesis}` 来直接设置文档格式
5. 如有必要，修改 `makefile` 文件的 `MAIN` 选项为自己 `tex` 文档的文件名
6. *make samplebib & Enjoy*

## 基本信息录入

```tex
%%=============================================================================%
%% 基本信息录入
%%-----------------------------------------------------------------------------%
\title{基于 LaTeX 排版的 \\ 西北工业大学论文模板}{          % 中英文标题
    Yet Another Thesis Template of \\ Northwestern Polytechnical University
}                                                           % 请自行断行
\author{\blindreview{张三丰}}{\blindreview{Sanfeng Zhang}}  % 姓名（添加盲评标记）
\date{2022年6月}{Jun 2022}                                  % 答辩日期
\school{数学与统计学院}{School of Mathematics and Statistics}% 学院
% 专业 博士请使用 Philosophy in XXXX，硕士只写 XXXX 即可
\major{数学}{Philosophy in Mathematics}                     % 专业
\advisor{\blindreview{李四海}}{\blindreview{Sihai Li}}      % 导师（添加盲评标记）
\studentnumber{2016123456}                                  % 学号
\funding{本研究得到玄学基金（编号23336666）资助．}{         % 基金资助
    The present work is supported by Funding of Metaphysics %
    (Project No：23336666).}                                %
%%=============================================================================%
```

## 常见问题 Q&A

* **Q：博士学位论文 or 硕士学位论文？**
  * 本模版**默认**为博士学位论文，并且**兼容**硕士学位论文。目前不兼容本科毕业设计论文（未来计划兼容）。
  * 硕士如需使用，请使用编辑器搜索 `degree=phd` 标志，并修改 `phd` 为 `master` 即可。
  * 本科毕业设计论文推荐直接使用 [polossk/LaTeX-Template-For-NPU-Thesis](https://github.com/polossk/LaTeX-Template-For-NPU-Thesis) 模板，该模板的格式控制均集成在 `setting.tex` 文件当中，更方便初学者使用与学习。
* **Q：参考文献的格式是哪个标准下的？**
  * 默认使用 `nputhesis.bst` [国标 GB/T 7714—2015 格式文件](https://github.com/zepinglee/gbt7714-bibtex-style)，请在 tex 文档中声明 `\bibliographystyle{nputhesis}`。
* **Q：我是 CTEX 套件用户，运行时出现错误，是什么原因？**
  * 因为 CTEX 套件**年久失修**，我们**没有适配**。请使用**不低于 Texlive 2021 版本**编写您的学位论文。
* **Q：为什么页眉出现了多余的数字编号？**
  * 因为 `fancyhdr` 在旧版本中 `leftmark` 有 bug，新版本已修复，请使用**不低于 Texlive 2021 版本**即可避免该问题。
* **Q：有专家评审问询到参考文献格式中为何会有多余的斜线（斜杠），这是什么原因？**
  * 最新国标是允许文档类型中通过斜线标注文档出处的，但是很多专家并不会关心新国标有哪些改动，会认为斜线是一种错误。如果遇到这种情况，请立即更换使用订正后的 `nputhesis-noslash.bst` 格式文件，如果有其他问题，请提交 issue，注明所引用的参考文献的类型以及对应的 `bibtex` 代码，最好展示出目前的输出结果与目标期望输出结果，方便我们帮助维护改正。
* **Q：我是 Linux/macOS 用户，字体是否兼容？**
  * 本模板使用的是 **Windows** 系统的自带字体（宋体、黑体、楷体、仿宋、Times New Roman、Consolas），Windows 环境下目前能保证字体的指向正确。
  * 本模板目前兼容 Linux 与 macOS 用户。请在编译的时候添加 `-shell-escape` 选项，以保证模板正确识别操作系统。
  * Linux 用户请检查自己的字体库中是否有上述字体，推荐从 Windows 系统上拷贝一整套字体（宋黑楷仿宋）以方便后续使用。
  * macOS 用户使用系统自带的宋、黑、楷、仿宋字体（华文字体系列），对应的字体名分别是：STSongti-SC-Regular、STHeiti、STKaiti、STFangSong。
* **Q：我是 macOS 用户，为什么我的黑体与别人的不一样？**
  * 这是由于 macOS 用户的黑体字体 `STHeiti` 与 Windows 上黑体字体 `SimHei` 本质上是两种不同的字体，因此部分汉字的显示效果有差异。目前非 Windows 操作系统的用户并没有取得 Windows 上黑体字体 `SimHei` 字体的授权，所以需要另外下载或拷贝使用。
  * 在文章送审时，你的评委老师的电脑极有可能是 Windows 的，所以为了避免字体显示问题（如文字很挤、字重不统一等），建议从 Windows 上拷贝一整套字体（宋黑楷仿宋），然后在文档类中添加选项 `winfonts=true` 以强制使用 Windows 字体。
  * 如果你觉得 Windows 上的字体也很丑不够美观，可以自行更换为其他开源或商用字体。比如开源的[思源宋体](https://github.com/adobe-fonts/source-han-serif)、[思源黑体](https://github.com/adobe-fonts/source-han-sans)，然后更新对应操作系统的字体配置。
  * 请注意，如果你的文章会被收录或者其他商业用途，建议使用开源字体或默认操作系统字体，以避免不必要的麻烦。
* **Q：我没有等宽字体（默认 Consolas），应该怎么办？**
  * 非 Windows 操作系统的用户（包括 macOS 与 Linux 用户）需要安装 Consolas 字体后使用，字体文件存放于 `fonts/English-Fonts/` 文件夹中。
  * `fonts` 文件夹与 [Fonts-For-NPU-Thesis-Template](https://github.com/NWPUMetaphysicsOffice/Fonts-For-NPU-Thesis-Template) 项目保持同步，可通过执行更新命令 `git submodule update --init --recursive` 来获取最新版本。
  * 如果有其他字体的需求，也可以自行更改 `yanputhesis.cls` 中 `\newcommand\codeFont{Consolas}` 为其他字体，例如修改为 `\newcommand\codeFont{Source Code Pro}` 以使用 `Source Code Pro` 字体。
* **Q：有没有 Overleaf 版本？**
  * 也许可以通过本 repo 在 Overleaf 上建立一个项目，但是可能会遇到字体问题，请再三斟酌。
* **Q：这个编译报错了 balabala，怎么解决？**
  * 请优先检索过往 issue 查看是否已有人提及相关解决方案。其次请确认是模板的 bug，我们将及时发布补丁。如果是其他问题，恕我们精力有限不能一一答复，建议善用搜索引擎或 ChatGPT。
* **Q：编译时卡顿了，怎么解决？**
  * 对于 Windows 电脑，如果在编译过程中遇到卡在字体缓冲问题，请先关闭当前进程，并用管理员模式打开命令提示符（或终端），键入 `fc-cache -f -v` 强制刷新字体缓存即可
* **Q：LaTeX 怎么调整公式大小/公式换行/怎么加粗？**
  * 抱歉，**恕制作者们不解答任何 LaTeX 使用问题**，请您自行百度或查阅相关书籍。
* **Q：请问默认的 `makefile` 提供了那些功能？**
  * 本模板提供了简单的 `makefile` 文件来控制编译流程，可以编译 `dtx` 文件从而得到模板类 `cls` 文件，也可以编译大论文文档 `yanputhesis-sample.tex`。
  * 所有基本流程为关闭当前已打开的输出 pdf 文件并删除，清理缓存文件，编译 tex 文档并打开。
  * 默认选项 `make` 或者 `make main` 负责编译编译 `dtx` 文件从而得到模板类 `yanputhesis.cls` 文件和样例文件 `yanputhesis-sample.tex`。
  * 提供选项 `make sample` 负责生成不含参考文献的样例文档 `yanputhesis-sample.pdf`
  * 提供选项 `make samplebib` 负责生成含有参考文献的样例文档 `yanputhesis-sample.pdf`
  * 同时提供了 `open[sample]`, `close`, `clean`, `wipe[sample]` 四组快捷指令，其效果如下：
    * `open[sample]`：使用 Acrobat 打开输出的 pdf 文件；
    * `close`：终止 Acrobat 进程从而关闭输出的 pdf 文件（会误伤其他以打开的文件）；
    * `clean`：删除 `*.aux` 和其他缓存文件；
    * `wipe[sample]`：删除输出的 pdf 文件；
  * 对于 Linux 玩家而言，可参考上述功能，并在此 `makefile` 基础上稍作修改即可使用。

## 成品预览

以下命令或环境按照实际论文中出现顺序排序：
* 封皮页及标题页 `\maketitle`
* 中文摘要及关键字 `\begin{abstract} ... \begin{keywords} ... \end{keywords} \end{abstract}`
* 英文摘要及关键字 `\begin{engabstract} ... \begin{engkeywords} ... \end{engkeywords} \end{engabstract}`
* 参考文献 `\bibliography{reference}`
* 附录 `\appendix \section{附录} ...`
* 致谢 `\begin{acknowledgements} ... \end{acknowledgements}`
* 发表的学术论文和参加科研情况 `\begin{accomplishments} ... \end{accomplishments}`
* 原创性声明 `\makestatement`

  |       |                展示                 |                 展示                  |
  | :---: | :---------------------------------: | :-----------------------------------: |
  | 预览  |       ![Coverpage][coverpage]       |    ![Frontpage_Chs][frontpage_chs]    |
  | 说明  |          封面页（外封面）           |      中文标题页（题名页/内封面）      |
  | 预览  |   ![Frontpage_Eng][frontpage_eng]   |     ![Abstract_Chs][abstract_chs]     |
  | 说明  |             英文标题页              |               中文摘要                |
  | 预览  |    ![Abstract_Eng][abstract_eng]    |       ![References][references]       |
  | 说明  |              英文摘要               |               参考文献                |
  | 预览  |        ![Appendix][appendix]        | ![Acknowledgements][acknowledgements] |
  | 说明  |                附录                 |                 致谢                  |
  | 预览  | ![Accomplishments][accomplishments] |        ![Statement][statement]        |
  | 说明  |            参加科研情况             |              原创性声明               |
  | 预览  |  ![Blindreview_On][blindreview_on]  |  ![Blindreview_Off][blindreview_off]  |
  | 说明  |              开启盲评               |             默认关闭盲评              |

## 其他注意事项

* **格式符说明**
  * 字体大小（size）的控制命令统一前缀为 `s`
  * 字体格式（font）的控制命令统一前缀为 `f`
* **开源许可问题**
  * 基于 [GPLv3-LICENSE](LICENSE)
  * 如有帮助，请在自己的文章中引用；如果在此基础上新增/删除/更改，请按照开源许可的要求继续保持开源，且同时继续使用相同开源许可

## 鸣谢

本模板的实现参考了目前仍在维护的模板，这些模板的贡献者有（按姓氏排序）:

* 西工大玄学办：Congzhuo Fang (@CongzhuoFang), Shangkun Shen (@polossk)，Zhihe Wang (@cfrpg)，Jiduo Zhang (@kidozh)，Lin Zhang (@DrLinZhang), Weijia Zhang (@njzwj)；
* 西北工业大学数学与统计学院：Yiqiang Li (@lyq105)，Ying Liu，Jiashu Lu，Zongze Yang (@lrtfm)；
* GitHub 热心网友：Li Kunyao (@likunyao)，@neilwth，@wayne17，Wei Wang (@WilmerWang)。

## 如何参与该项目

您的使用与推广就是对本项目的最大支持！如果您想贡献代码或参与后期维护，我们十分欢迎！
  * 目前模板成型于 **2022 年**。如果后期有任何格式上的变化，欢迎 *fork-modify-pull-request* 或者在 [issue](hhttps://github.com/NWPUMetaphysicsOffice/Yet-Another-LaTeX-Template-for-NPU-Thesis/issues) 中详细说明新旧格式之差异，我们乐意解决模板使用的问题
  * 如果您已经光速修复了 bug，欢迎提交 pull-request 至 public-dev 分支当中，我们会及时将您的代码与更新日志一同合并至 master 分支，并署名鸣谢
  * 如果需要改动，您可能需要使用 `zhmakeindex` 来维护更新清单，请[下载](https://github.com/leo-liu/zhmakeindex/releases/tag/zhmakeindex-1.2)对应操作系统的可执行文件

## 如何赞助该项目<del>（钞能力催更）<del>

<del>如果本项目对您的顺利毕业有那么一点点的帮助，希望您慷慨解囊。</del>

开个玩笑。玄学办不拒绝您的合法资助，并且会公示您的资助金额与后续用途。目前支持扫码赞助，欢迎有条件的同学、老师请玄学办的小伙伴喝咖啡:)
<p align="center">
<img src="https://github.com/NWPUMetaphysicsOffice/Yet-Another-LaTeX-Template-for-NPU-Thesis/raw/Sponsorships/wechat_donate_appcode.jpg" width="30%"/>
<img src="https://github.com/NWPUMetaphysicsOffice/Yet-Another-LaTeX-Template-for-NPU-Thesis/raw/Sponsorships/alipay_donate_qrcode_polossk.jpg" width="30%"/>
</p>

### 打赏记录

> 截止 2023 年 11 月 4 日，共收到赞赏 9 次，累积收款 68.50 元，感谢各位大佬的资助！因篇幅限制，详细捐献清单请查阅 [Sponsorships](https://github.com/NWPUMetaphysicsOffice/Yet-Another-LaTeX-Template-for-NPU-Thesis/blob/Sponsorships/README.md)

| 时间                    | 平台       | 金额   | 昵称         | 单号                                | 留言备注                                     |
| ----------------------- | ---------- | ------ | ------------ | ----------------------------------- | -------------------------------------------- |
| 2023年11月4日 21:00:18  | 微信赞赏码 | ¥4.88  | 许\*\*\*\*6  | 10001081012023110417108\*\*\*\*0006 | 感谢分享                                     |
| 2023年11月1日 11:02:57  | 微信赞赏码 | ¥9.88  | 邹\*\*       | 10001081012023110117122\*\*\*\*6936 | 感谢                                         |
| 2023年10月20日 23:29:14 | 支付宝扫码 | ¥2.00  | \*\*声       | 20231020220014480414\*\*\*\*8150    |                                              |
| 2023年10月7日 14:53:34  | 支付宝扫码 | ¥20.00 | \*天         | 20231007220014301114\*\*\*\*9426    | 谢谢小伙伴维护latex模板。请喝咖啡！          |
| 2023年9月7日 21:22:35   | 支付宝扫码 | ¥3.66  | \*畅         | 20230907220014803614\*\*\*\*9102    | gayhub论文模板资助                           |
| 2023年6月5日 10:44:51   | 微信赞赏码 | ¥6.66  | 无名大侠     | 10001081012023060515131\*\*\*\*6258 | 赞                                           |
| 2023年5月9日 15:57:16   | 微信赞赏码 | ¥9.88  | N\*\*\*\*l   | 10001081012023050918126\*\*\*\*5891 | 辛苦大佬维护latex npu thesis！赞助一杯瑞幸！ |
| 2023年4月27日 12:05:45  | 微信赞赏码 | ¥4.88  | 逍\*\*\*\*歌 | 10001081012023042715108\*\*\*\*6929 |                                              |
| 2023年3月7日 13:12:59   | 微信赞赏码 | ¥6.66  | c\*\*\*\*w   | 10001081012023030719120\*\*\*\*6288 |                                              |

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

Use this code whatever you want, under the circumstances of acknowledging the GPL license on this page below. Star this repository if you like, and it will be very generous of you!

## License

Copyright (c) 2016-2022 _NWPU Metaphysics Office_ <https://github.com/NWPUMetaphysicsOffice>

This repo is under the license of **GNU General Public License v3.0**. Check the [license](https://github.com/NWPUMetaphysicsOffice/Yet-Another-LaTeX-Template-for-NPU-Thesis/blob/master/LICENSE "license") for details.

The association _NWPU Metaphysics Office_ is a club-like student group. The
members are cfrpg, kidozh, njzwj, polossk, in alphabet order.

## 彩蛋

* ![PhD-Thesis](https://img.shields.io/badge/PhD-Thesis-D11A2D.svg) ![Master-Thesis](https://img.shields.io/badge/Master-Thesis-1177B0.svg) 分别对应着博士服与硕士服的颜色。

[poster]: https://github.com/NWPUMetaphysicsOffice/Yet-Another-LaTeX-Template-for-NPU-Thesis/raw/master/poster.png
[coverpage]: https://github.com/NWPUMetaphysicsOffice/Yet-Another-LaTeX-Template-for-NPU-Thesis/raw/master/preview/coverpage.png
[frontpage_chs]: https://github.com/NWPUMetaphysicsOffice/Yet-Another-LaTeX-Template-for-NPU-Thesis/raw/master/preview/frontpage_chs.png
[frontpage_eng]: https://github.com/NWPUMetaphysicsOffice/Yet-Another-LaTeX-Template-for-NPU-Thesis/raw/master/preview/frontpage_eng.png
[abstract_chs]: https://github.com/NWPUMetaphysicsOffice/Yet-Another-LaTeX-Template-for-NPU-Thesis/raw/master/preview/abstract_chs.png
[abstract_eng]: https://github.com/NWPUMetaphysicsOffice/Yet-Another-LaTeX-Template-for-NPU-Thesis/raw/master/preview/abstract_eng.png
[references]: https://github.com/NWPUMetaphysicsOffice/Yet-Another-LaTeX-Template-for-NPU-Thesis/raw/master/preview/references.png
[appendix]: https://github.com/NWPUMetaphysicsOffice/Yet-Another-LaTeX-Template-for-NPU-Thesis/raw/master/preview/appendix.png
[acknowledgements]: https://github.com/NWPUMetaphysicsOffice/Yet-Another-LaTeX-Template-for-NPU-Thesis/raw/master/preview/acknowledgements.png
[accomplishments]: https://github.com/NWPUMetaphysicsOffice/Yet-Another-LaTeX-Template-for-NPU-Thesis/raw/master/preview/accomplishments.png
[statement]: https://github.com/NWPUMetaphysicsOffice/Yet-Another-LaTeX-Template-for-NPU-Thesis/raw/master/preview/statement.png
[blindreview_on]: https://github.com/NWPUMetaphysicsOffice/Yet-Another-LaTeX-Template-for-NPU-Thesis/raw/master/preview/blindreview_on.png
[blindreview_off]: https://github.com/NWPUMetaphysicsOffice/Yet-Another-LaTeX-Template-for-NPU-Thesis/raw/master/preview/blindreview_off.png
