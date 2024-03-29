;; common lisp for emacs
(eval-when-compile
  (require 'cl-lib))

;; initialize package archives
(require 'package)
(setq package-enable-at-startup nil
	  package-archives
	  '(("gnu" . "http://elpa.gnu.org/packages/")
		("elpy" . "https://jorgenschaefer.github.io/packages/")
		;; ("marmalade" . "http://marmalade-repo.org/elpa/")
		("melpa" . "http://melpa.milkbox.net/packages/")
		("melpa-stbl" . "https://stable.melpa.org/packages/")
		("org" . "http://orgmode.org/elpa/"))
	  package-archive-priorities
	  '(("gnu" . 10)
		("melpa-stbl" . 5)
		("melpa" . 3)))
(package-initialize)

;; install use-package if necessary
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; enable use-package for compile
(eval-when-compile
  (require 'use-package))

;; load path where configurations files are kept
(add-to-list 'load-path "~/.emacs.d/configurations")

;; general-config
(require 'general-config)

;; miscellaneous-config
(require 'miscellaneous-config)

;; python-config
(require 'python-config)
