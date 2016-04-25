!*===========================================================================*
!                                                                            *
!   srcdoc.l    Source file documentation generator 1.0                      *
!                                                                            *
!   Written:    96/04/09  Pieter Hintjens <ph@imatix.com>                    *
!   Revised:    96/04/17                                                     *
!                                                                            *
!   Copyright:  Copyright (c) 1996 iMatix N.V.                               *
!                                                                            *
!   This program is free software; you can redistribute it and/or modify     *
!   it under the terms of the GNU General Public License as published by     *
!   the Free Software Foundation; either version 2 of the License, or        *
!   (at your option) any later version.                                      *
!                                                                            *
!   This program is distributed in the hope that it will be useful,          *
!   but WITHOUT ANY WARRANTY; without even the implied warranty of           *
!   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            *
!   GNU General Public License for more details.                             *
!                                                                            *
!   You should have received a copy of the GNU General Public License        *
!   along with this program; if not, write to the Free Software              *
!   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.                *
!*===========================================================================*

-schema=lrschema.pl

After-Init:
    (--) Ok                                 -> Have-Source-File
          + Initialise-Program-Data
          + Load-Anchor-Definitions
          + Parse-Coverpage-File
          + Get-Next-Source-File
    (--) Error                              ->
          + Terminate-The-Program

Have-Source-File:
    (--) Include                            -> Parsing-Include
          + May-Have-First-Include-File
          + Prepare-To-Parse-File
          + Look-For-Interesting-Line
    (--) Code                               -> Parsing-Code
          + May-Have-First-Code-File
          + Prepare-To-Parse-File
          + Look-For-Interesting-Line
    (--) Empty                              -> Have-Source-File
          + Get-Next-Source-File
    (--) No-More                            ->
          + Terminate-The-Program

Parsing-Include:
    (--) Prolog                             -> Parsing-Include
          + Build-Tables-Of-Definitions
          + Parse-Prolog-Block
          + Look-For-Interesting-Line
    (--) Define                             -> Parsing-Include
          + Parse-Define-Command
          + Look-For-Interesting-Line
    (--) Typedef                            -> Parsing-Include
          + Parse-Typedef-Command
          + Look-For-Interesting-Line
    (--) Proto                              -> Parsing-Include
          + Parse-Function-Prototype
          + Look-For-Interesting-Line
    (--) Header                             -> Parsing-Include
          + Ignore-Function-Header
          + Look-For-Interesting-Line
    (--) No-More                            -> Have-Source-File
          + Build-Tables-Of-Definitions
          + Get-Next-Source-File

Parsing-Code:
    (--) Prolog                             -> Parsing-Code
          + Look-For-Interesting-Line
    (--) Define                             -> Parsing-Code
          + Look-For-Interesting-Line
    (--) Typedef                            -> Parsing-Code
          + Look-For-Interesting-Line
    (--) Proto                              -> Parsing-Code
          + Look-For-Interesting-Line
    (--) Header                             -> Parsing-Code
          + Parse-Function-Header
          + Parse-Function-Body
          + Build-Function-Definition
          + Look-For-Interesting-Line
    (--) No-More                            -> Have-Source-File
          + Get-Next-Source-File

Defaults:
    (--) Exception                          ->
          + Terminate-The-Program
