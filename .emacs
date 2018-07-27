;;-------common-------

;; hide menu bar:
(menu-bar-mode -1)

;; set tabs to spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
;; set tab width in text mode:
(setq indent-line-function 'insert-tab)


;;(desktop-save-mode 1)  ;; saving emacs sessions.

;; change all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;;don't make any backup files.
(setq make-backup-files  nil)

;; do not dispaly the *GNU Emacs* window when emacs startup
(setq inhibit-startup-message t)

;; make system copy work with Emacs paste and Emacs copy work with system paste.
;; this only works when you open emacs with GUI mode.
(setq x-select-enable-clipboard t)

;; when use emacs --nw, this helps copy work with system paste.
(setq interprogram-cut-function
      (lambda (text &optional push)
    (let* ((process-connection-type nil)
           (pbproxy (start-process "pbcopy" "pbcopy" "/usr/bin/pbcopy")))
      (process-send-string pbproxy text)
      (process-send-eof pbproxy))))

;;auto reload file:
(global-auto-revert-mode t)

(iswitchb-mode 1)

(customize-variable (quote tab-stop-list))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js-indent-level 2)
 '(package-selected-packages
   (quote
    (go-mode markdown-mode json-mode ws-trim solidity-mode)))
 '(tab-stop-list
   (quote
    (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120)))
 '(typescript-indent-level 2))

;; untabify and delete-trailling-whitespaces on save in some mode:
(setq alexott/untabify-modes
      '(emacs-lisp-mode
        java-mode scala-mode c-mode go-mode web-mode nxml-mode
        sgml-mode groovy-mode javascript-mode thrift-mode
        js-mode coffee-mode yaml-mode solidity-mode typescript-mode
        json-mode))

(defun alexott/untabify-hook()
  (when (member major-mode alexott/untabify-modes)
    (delete-trailing-whitespace)
    (untabify (point-min) (point-max))))

(add-hook 'before-save-hook 'alexott/untabify-hook)

;;-------------- package archieves setting -------------
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)


;; ------------ indentation settings --------------

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2))

(add-hook 'web-mode-hook  'my-web-mode-hook)
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq web-mode-code-indent-offset 2)

(require 'css-mode)
(setq css-indent-offset 2)
