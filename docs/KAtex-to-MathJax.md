# KaTeX → MathJax 迁移步骤

## 1. 改 `mkdocs.yml`

**`extra_css`** — 删掉 katex CSS 那一行：

```yaml
extra_css:
  - stylesheets/extra.css
```

**`extra_javascript`** — 三行换两行：

```yaml
extra_javascript:
  - javascripts/mathjax.js
  - https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js
```

**其余不变**（`pymdownx.arithmatex: generic: true` 保留）。

## 2. 新建 `docs/javascripts/mathjax.js`

```js
window.MathJax = {
  tex: {
    inlineMath: [["$", "$"], ["\\(", "\\)"]],
    displayMath: [["$$", "$$"], ["\\[", "\\]"]],
    processEscapes: true,
  },
  options: {
    ignoreHtmlClass: ".*|",
    processHtmlClass: "arithmatex"
  }
};

document$.subscribe(() => {
  MathJax.typesetPromise();
});
```

## 3. 删掉 `docs/javascripts/katex.js`

## 4. 验证

```bash
mkdocs serve
```

打开浏览器检查 `$E=mc^2$` 和 `$$x^2$$` 是否正常渲染。
