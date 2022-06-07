<div align="center"><table><tr><td>
<h1 align="center">
  <a href="https://github.com/z-shell/zi">
    <img align="center" src="https://github.com/z-shell/zi/raw/main/docs/images/logo.svg" alt="Logo" width="60" height="60" />
  </a> ❮ ZI ❯ Annex - Unscope </h1>
  <!--  <h2>
    <p><img align="center" src="" alt=""></p>
  </h2> -->
</td></tr></table></div>

## 💡 Wiki: [unscope](https://z.digitalclouds.dev/ecosystem/annexes/unscope) - [annexes](https://z.digitalclouds.dev/ecosystem/annexes)

An annex (i.e. an extension) for [ZI](https://github.com/z-shell/zi) that allows to install plugins without specifying the GitHub
user name. It works as follows:

1. On the installation of a plugin without any slashes (/) in its name the
   annex will query the GitHub API searching for **\*/{the-name}**, sorting on
   stars.

2. It first requires at least 10 forks on the candidates, then 2, then 0.

3. After finding the best result it sets it as the **full** remote-id of the
   plugin, storing the ID on disk for later automatic use.

4. For security, for such GH-API request to be made a newly added (by this
   annex) ice: `ghapi` is required to be given.

5. Otherwise only the static database of mappings of short-plugin nicknames to
   the full scoped IDs will be searched. It contains many mappings, like, e.g.:
   **vi-reg** → **zsh-vi-more/evil-registers**, and also the usual basic
   unscopings of some of the popular plugins out there, like, e.g.:
   **zsh-syntax-highlighting** → **zsh-users/zsh-syntax-highlighting** and more.

# Install with [ZI](https://github.com/z-shell/zi)

Simply load as a regular plugin, i.e.:

```zsh
zi light-mode for z-shell/z-a-unscope
```

It should be done possibly early in the `zshrc`, as otherwise the preceding
`zi` calls will not have the unscoped IDs resolved.
