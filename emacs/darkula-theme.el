(require 'autothemer) 

(autothemer-deftheme
    darkula "A custom version of the famous dracula theme"
 
((((class color) (min-colors #xFFFFFF))) ;; We're only concerned with graphical Emacs

 (bg        "#191622")
 (fg        "#f8f8f2")
 (comment   "#6272a4")
 (black     "#1E2029")
 (purple    "#bd93f9")
 (cyan      "#8be9fd")
 (green     "#50fa7b")
 (orange    "#ffb86c")
 (pink      "#ff79c6")
 (red       "#ff5555")
 (yellow    "#f1fa8c")
 (selection "#44475A")
 (blue      "#61bfff")
 (dark-blue "#0189cc")
 )


 (;; UI
  (default                              (:foreground fg :background bg))
  (fringe                               (:background nil))
  (cursor                               (:background purple))
  (region                               (:background selection))
  (mode-line                            (:background bg))
  (line-number                          (:foreground comment :background nil))
  (info-index-match                     (:foreground purple :background nil))
  (highlight                            (:background selection))
  (show-paren-match                     (:underline t :bold t :foreground pink :background nil))

  ;; Syntax highlight font-lock
  (font-lock-keyword-face               (:foreground pink))
  (font-lock-builtin-face               (:foreground orange))
  (font-lock-function-name-face         (:foreground green))
  (font-lock-variable-name-face         (:foreground fg))
  (font-lock-type-face                  (:foreground cyan))
  (font-lock-string-face                (:foreground yellow))
  (font-lock-regexp-grouping-backslash  (:foreground cyan))
  (font-lock-regexp-grouping-construct  (:foreground purple))
  (font-lock-constant-face              (:foreground cyan))
  (font-lock-comment-delimiter-face     (:foreground comment))
  (font-lock-comment-face               (:foreground comment))
  (font-lock-warning-face               (:foreground red))

  ;; Dired
  (dired-directory                      (:foreground purple))
  (dired-symlink                        (:foreground green))

  ;; Diredp
  (diredp-dir-name        (:foreground purple))
  (diredp-dir-heading     (:underline t :bold t :foreground purple))
  (diredp-file-name       (:foreground fg))
  (diredp-symlink         (:foreground green))
  (diredp-number          (:foreground fg))
  (diredp-executable-tag  (:foreground fg))
  (diredp-no-priv         (:background nil)) 
  (diredp-date-time       (:foreground fg))
  (diredp-dir-priv        (:foreground fg))
  (diredp-rare-priv       (:foreground fg))
  (diredp-read-priv       (:foreground fg))
  (diredp-link-priv       (:foreground fg))
  (diredp-exec-priv       (:foreground fg))
  (diredp-write-priv      (:foreground fg))
  (diredp-file-suffix     (:foreground fg))
  (diredp-omit-file-name  (:strike-through nil :foreground comment))
  
  ;; Mini-modeline
  (mini-modeline-mode-line          (:background purple :height 0.2))
  (mini-modeline-mode-line-inactive (:background comment :height 0.1))

  ;; Markdown
  (markdown-code-face             (:foreground yellow :background nil :box nil))
  (markdown-header-face           (:bold t :foreground green :background nil :box nil :font "JetBrainsMonoExtraBold Nerd Font 13"))
  (markdown-header-delimiter-face (:bold t :foreground pink :background nil :box nil))
  (markdown-list-face             (:bold t :foreground cyan :background nil :box nil))
  (markdown-language-keyword-face (:foreground comment :background nil :box nil))
  (markdown-bold-face             (:foreground fg :background nil :box nil :font "JetBrainsMonoExtraBold Nerd Font"))
  (markdown-italic-face           (:foreground fg :background nil :box nil))

  ;; Evil
  (evil-ex-info                                 (:foreground red :slant 'italic))
  (evil-ex-search                               (:background purple :foreground black :weight 'bold))
  (evil-ex-substitute-matches                   (:background black :foreground red :weight 'bold :strike-through t))
  (evil-ex-substitute-replacement               (:background black :foreground green :weight 'bold))
  (evil-search-highlight-persist-highlight-face (:inherit 'lazy-highlight))

  ;; Company
  (company-tooltip-common     (:foreground purple :distant-foreground black :weight 'bold))
  (company-tooltip-search     (:background purple :foreground bg :distant-foreground fg :weight 'bold))
  (company-tooltip-selection  (:background selection :weight 'bold))
  (company-tooltip-mouse      (:background pink :foreground bg :distant-foreground fg))
  (company-tooltip-annotation (:foreground purple :distant-foreground bg))
  (company-scrollbar-fg       (:background purple))
  (company-preview            (:foreground comment))
  (company-preview-common     (:background selection :foreground purple))

  ;; tree Sitter
  (tree-sitter-hl-face:attribute (:foreground green))
  (tree-sitter-hl-face:constant (:foreground purple))
  (tree-sitter-hl-face:constant.builtin (:foreground purple))
  (tree-sitter-hl-face:escape (:foreground pink))
  (tree-sitter-hl-face:function (:foreground green))
  (tree-sitter-hl-face:function.builtin (:foreground purple))
  (tree-sitter-hl-face:function.call (:foreground green))
  (tree-sitter-hl-face:method (:foreground green))
  (tree-sitter-hl-face:method.call (:foreground green))
  (tree-sitter-hl-face:type (:italic t :foreground cyan))
  (tree-sitter-hl-face:type.builtin (:italic t :foreground cyan))
  ))

(provide-theme 'darkula)
;;; colors.el ends here
