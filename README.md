# LaTeX Template For NPU PHD/Master thesis

![Platfrom](https://img.shields.io/badge/Platfrom-TeXLive2016-3D6117.svg)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

## Origin

本repo直接来自于开源库[LaTeX-Template-For-NPU-Thesis](https://github.com/NWPUMetaphysicsOffice/LaTeX-Template-For-NPU-Thesis)

本repo格式参照于2014年西北工业大学研究生院编写的[西北工业大学博士研究生学位论文编写规则（试用版）](http://gs.nwpu.edu.cn/info/1143/1139.htm)

## Usage

1. clone这个项目到本地
2. 直接对 `example.tex` 文件进行修改
3. 如有必要，请仿照 `example.tex` 在 *导言区* 引用 `\input{settings/thesis-setting}`
4. 如有必要，修改 `makefile` 文件的 `MAIN` 选项为自己 `tex` 文档的文件名
5. make & Enjoy

## Note

* 根据西北工业大学博士研究生学位论文编写规则，本TeX模板使用的是Windows下的**宋体**和**Times New Roman**
* `cover.tex` 文件为论文的中文封面页,  `eng_cover.tex` 文件为论文的中文封面页
* 所有字体大小的控制命令统一前缀为`s(a.k.a size)`, 所有字体格式的控制命令统一前缀为`f(a.k.a font)`
* `makefile` 中的 `close`, `clean` 以及 `wipe` 选项为 `windows` 专用, 并且假设使用了 `Acrobat` 打开了当前 pdf 文件

* 如有任何问题，请发issue
* 欢迎fork

## BibTeX

```bibtex
@misc{NWPUThesisLaTeXTemplate,
    title={{{\LaTeX}}-Template-For-NPU-Thesis},
    author={Shangkun Shen and Jiduo Zhang},
    year={2016},
    month={05}
}
```

## LICENCE

MIT LICENCE
