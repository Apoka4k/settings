;;;
;;; ext.el
;;;
;;; Add bindings to the C mode keymap that insert various structured comment
;;; templates for the ext system
;;;
;;; This file was generated automatically from ext.m4 -- do not edit
;;;


(defun ext-insert-cfile ()
  "Insert a CFile template."
  (interactive)
  (save-excursion (insert "/* ---------------------------------------------------------------------------


  This file is part of the ``XXX'' package of NuSMV version 2.
  Copyright (C) 2003 by FBK-irst.

  NuSMV version 2 is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation; either
  version 2 of the License, or (at your option) any later version.

  NuSMV version 2 is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General Public
  License along with this library; if not, write to the Free Software
  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307  USA.

  For more information on NuSMV see <http://nusmv.fbk.eu>
  or email to <nusmv-users@fbk.eu>.
  Please report bugs to <nusmv-users@fbk.eu>.

  To contact the NuSMV development board, email to <nusmv@fbk.eu>. 

-----------------------------------------------------------------------------*/

/*!
  \\author Name Surname
  \\brief \\todo: Missing description

  \\todo: Missing description

*/


#include \"Int.h\"

/*---------------------------------------------------------------------------*/
/* Constant declarations                                                     */
/*---------------------------------------------------------------------------*/


/*---------------------------------------------------------------------------*/
/* Type declarations                                                         */
/*---------------------------------------------------------------------------*/


/*---------------------------------------------------------------------------*/
/* Structure declarations                                                    */
/*---------------------------------------------------------------------------*/


/*---------------------------------------------------------------------------*/
/* Variable declarations                                                     */
/*---------------------------------------------------------------------------*/


/*---------------------------------------------------------------------------*/
/* Macro declarations                                                        */
/*---------------------------------------------------------------------------*/


/**AutomaticStart*************************************************************/

/*---------------------------------------------------------------------------*/
/* Static function prototypes                                                */
/*---------------------------------------------------------------------------*/

/**AutomaticEnd***************************************************************/


/*---------------------------------------------------------------------------*/
/* Definition of exported functions                                          */
/*---------------------------------------------------------------------------*/


/*---------------------------------------------------------------------------*/
/* Definition of internal functions                                          */
/*---------------------------------------------------------------------------*/


/*---------------------------------------------------------------------------*/
/* Definition of static functions                                            */
/*---------------------------------------------------------------------------*/



")))


(defun ext-insert-cheaderfile ()
  "Insert a CHeaderFile template."
  (interactive)
  (save-excursion (insert "/* ---------------------------------------------------------------------------


  This file is part of the ``XXX'' package of NuSMV version 2.
  Copyright (C) 2003 by FBK-irst.

  NuSMV version 2 is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation; either
  version 2 of the License, or (at your option) any later version.

  NuSMV version 2 is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General Public
  License along with this library; if not, write to the Free Software
  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307  USA.

  For more information on NuSMV see <http://nusmv.fbk.eu>
  or email to <nusmv-users@fbk.eu>.
  Please report bugs to <nusmv-users@fbk.eu>.

  To contact the NuSMV development board, email to <nusmv@fbk.eu>. 

-----------------------------------------------------------------------------*/

/*!
  \\author Name Surname
  \\brief \\todo: Missing description

  \\todo: Missing description

*/

#ifndef _
#define _

/*---------------------------------------------------------------------------*/
/* Constant declarations                                                     */
/*---------------------------------------------------------------------------*/


/*---------------------------------------------------------------------------*/
/* Type declarations                                                         */
/*---------------------------------------------------------------------------*/


/*---------------------------------------------------------------------------*/
/* Structure declarations                                                    */
/*---------------------------------------------------------------------------*/


/*---------------------------------------------------------------------------*/
/* Variable declarations                                                     */
/*---------------------------------------------------------------------------*/


/*---------------------------------------------------------------------------*/
/* Macro declarations                                                        */
/*---------------------------------------------------------------------------*/


/**AutomaticStart*************************************************************/

/*---------------------------------------------------------------------------*/
/* Function prototypes                                                       */
/*---------------------------------------------------------------------------*/

/**AutomaticEnd***************************************************************/

#endif /* _ */
")))


(defun ext-insert-enum ()
  "Insert a Enum template."
  (interactive)
  (save-excursion (insert "/*!
  \\brief \\todo Missing synopsis

  \\todo Missing description
*/
")))


(defun ext-insert-function ()
  "Insert a Function template."
  (interactive)
  (save-excursion (insert "/*!
  \\brief \\todo Missing synopsis

  \\todo Missing description
*/
")))


(defun ext-insert-macro ()
  "Insert a Macro template."
  (interactive)
  (save-excursion (insert "/*!
  \\brief \\todo Missing synopsis

  \\todo Missing description
*/
#define

")))


(defun ext-insert-struct ()
  "Insert a Struct template."
  (interactive)
  (save-excursion (insert "/*!
  \\struct XXX
  \\brief \\todo Missing synopsis

  \\todo Missing description
*/
")))


(defun ext-insert-variable ()
  "Insert a Variable template."
  (interactive)
  (save-excursion (insert "/*!
  \\brief \\todo Missing synopsis

  \\todo Missing description
*/
")))


(defun ext-insert-makefile ()
  "Insert a Variable template."
  (interactive)
  (save-excursion (insert
"# FileName	[ Makefile ]
#
# PackageName	[ ]
#
# Synopsis	[ Package-wide Makefile ]
#
# Description	[ ]
#
# Author	[ ]
#
# Copyright   [
# This file is part of the ``'' package.
  #%COPYRIGHT%]
")))


(define-key c-mode-map "\M-1" 'ext-insert-cfile)
(define-key c-mode-map "\M-2" 'ext-insert-cheaderfile)
(define-key c-mode-map "\M-3" 'ext-insert-makefile)
(define-key c-mode-map "\M-4" 'ext-insert-function)
(define-key c-mode-map "\M-5" 'ext-insert-macro)
(define-key c-mode-map "\M-6" 'ext-insert-struct)
(define-key c-mode-map "\M-7" 'ext-insert-enum)
(define-key c-mode-map "\M-8" 'ext-insert-variable)


;; Local Variables:
;; mode: lisp
;; End:
