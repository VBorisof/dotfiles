;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (add-to-list 'load-path "<path where use-package is installed>")
  (require 'use-package)
  (setq use-package-always-ensure t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(auto-image-file-mode t)
 '(blink-cursor-mode t)
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes nil)
 '(custom-safe-themes
   (quote
    ("d1cc05d755d5a21a31bced25bed40f85d8677e69c73ca365628ce8024827c9e3" "08a89acffece58825e75479333109e01438650d27661b29212e6560070b156cf" default)))
 '(fci-rule-color "#383838")
 '(inhibit-startup-screen t)
 '(omnisharp-auto-complete-popup-help-delay 1)
 '(omnisharp-imenu-support t)
 '(package-selected-packages
   (quote
    (rjsx-mode jsx-mode js-auto-format-mode js-auto-beautify yafolding hideshow-org multiple-cursors cyberpunk-theme klere-theme green-screen-theme use-package dired-sidebar projectile ac-html ac-html-angular ac-html-csswatcher omnisharp web-completion-data typescript-mode)))
 '(tab-width 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(use-package package)


;;;;;;;;;;;;; Macros ;;;;;;;;;;;;;;;

(fset 'c-comment-line
  "\C-[OH\C-[[1;5C\C-[[1;5D// \C-n")

(fset 'insert-line-above	  
	  "\C-[OH\C-m\C-p\C-i")


;;;;;;;;;; Functions ;;;;;;;;;;;;;;;

(defun revert-buffer-no-confirm ()
  "Revert (refresh) buffer without confirmation"
  (interactive)
  (revert-buffer :ignore-auto :noconfirm))


(defun move-line-up()
  "Move the current line up."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down()
  "Move the current line down."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))


;;;;;;;;;;; Setup ;;;;;;;;;;;;;;;;

(use-package projectile)
(use-package yafolding)

(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )


(setq default-tab-width 2)
(set-variable 'typescript-indent-level 2)
(setq-default indent-tabs-mode nil)

(column-number-mode)
(global-linum-mode)
(projectile-mode 1)
(yafolding-mode)
(global-auto-revert-mode)

(setq scroll-step            1
      scroll-conservatively  10000)


;;;;;;;;;;;;;;;;;;; Key bindings ;;;;;;;;;;;;;;;;;;;;;;;

;;;; Editing ;;;;
(global-set-key (kbd "C-l") 'kill-whole-line)

(global-set-key (kbd "M-k") 'move-line-up)
(global-set-key (kbd "M-j") 'move-line-down)

(global-set-key (kbd "C-c c") 'c-comment-line)
(global-set-key (kbd "<M-RET>") 'insert-line-above)


;;;; Buffers ;;;;
(global-set-key (kbd "C-TAB C-i") 'next-buffer)
(global-set-key (kbd "<backtab>") 'previous-buffer)


;;;; Projectile ;;;;
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-f f") 'projectile-find-file)

;;;; Windows ;;;;;
(global-set-key (kbd "C-x p") 'previous-multiframe-window)

(global-set-key (kbd "C-x ]") 'shrink-window-horizontally)
(global-set-key (kbd "C-x [") 'shrink-window)


;;;; Yafolding ;;;;
(global-set-key (kbd "C-x \\") 'yafolding-toggle-element)
