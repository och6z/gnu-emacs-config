;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Python configurations ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; python language in emacs
(use-package python
  :ensure nil
  :mode
  ("\\.py$" . python-mode)
  :config
  (setq python-shell-interpreter "python"
		python-indent-offset 4
		python-indent-guess-indent-offset t
		python-indent-guess-indent-offset-verbose nil
		;; iPython interpreter
		; python-shell-interpreter "ipython"
		; python-shell-interpreter-args "--simple-prompt -i"
		))

;; emacs python development environment
(use-package elpy
  :ensure t
  :defer t
  :after python
  :init
  (add-hook 'python-mode-hook 'elpy-mode)
  ;; :config
  ;; (elpy-rpc-backend "jedi")
  )

;; (use-package company-jedi
;;   :ensure t
;;   :defer t
;;   :after
;;   (:all python jedi company)
;;   :preface
;;   (defun enable-jedi ()
;; 	(setq-local company-backends
;; 				(append '(company-jedi) company-backends)))
;;   :init
;;   (with-eval-after-load 'company
;; 	(add-hook 'python-mode-hook 'enable-jedi)))

;; minor mode for working with django projects
(use-package pony-mode
  :ensure t
  :defer t
  :after python)

;; featureful virtualenv tool for emacs
(use-package virtualenvwrapper
  :ensure t
  :after python
  :config
  (setq venv-location "~/.pyenv/versions/")
  (setq-default mode-line-format (cons '(:exec venv-current-name) mode-line-format)))

;; lightweight auto activate python virtualenvs
(use-package auto-virtualenvwrapper
  :ensure t
  :after
  (:all python virtualenvwrapper)
  :init
  (add-hook 'python-mode-hook #'auto-virtualenvwrapper-activate))

;; use autopep8 to beautify a python buffer
(use-package py-autopep8
  :ensure t
  :after python
  :config
  (setq py-autopep8-options '("--max-line-length=100"))
  :init
  (add-hook 'python-mode-hook 'py-autopep8-enable-on-save))

;; use isort to sort the imports in a python buffer
(use-package py-isort
  :ensure t
  :after python
  :config
  (setq py-isort-options '("--lines=100"))
  :init
  (add-hook 'before-save-hook 'py-isort-before-save))

;; add the symbol name to the features list
(provide 'python-config)
