# VIM cheatsheet
## Really Helpful
	.						Repeat last modification
	c{motion}		clear and enter Insert mode
	f{char}			Move forward to that char
	J						Join line with one below it
	zt					scroll line with cursor to top of screen
	z.					scroll line with cursor to middle of screen
	zb					scroll line with cursor to bottom of screen
	gx					open URL in browser (cursor must be on URL)
	Ctrl+A			increment number
	Crtl+X			decrement number
	:!					enter shell command
	Ctrl+L			Refresh screen, use if the display gets wonky
	:%s /,/\r/g	replace all commas with a new line

## Exit
	ZZ					Write (if changes) and quit
	:q!					Force Quit, don't save changes

## Insert
	i						Enter Insert Mode 
	I						Insert at beginning of line
	A						Append to end of line
	o						Begin new line below cursor
	O						Begin new line above cursor

## Cut/Delete #they are the same
	x						Delete character under cursor
	dd					Delete entire line
	D						Delete from cursor to end of line
	d{motion}		Delete word or char based on motion
	Y						Yank current line

## Highlight
	v						highlight char
	V						highlight line
	Ctrl+v			highlight block
	y						Yank (Copy) # in Visual mode

## Paste
	p						Paste 

## Change/Replace
	~						Switch case of character under cursor
	u						Undo
	Ctrl+r			Redo
	r						Replace single character
	R						Enter Replace Mode

## Navigation
	$						End of line
	0						Start of line 
	^						First non-whitespace of line
	gg					Beginning of file
	G						End of file	
	w						Next word 
	e						End of word
	b						Beginning of word 

## Tabs
	<tab>				go to next tab
	Shft+<tab>	go to previous tab
	:tabo				close all other tabs
	:qa					close all tabs
	:wqa				write and close all tabs
	:tabs				list all tabs

## Buffers
	:ls					list existing buffers

## Folds
	zr					open next level of folds
	zR					open all folds
	zm					close next level of folds
	zM					close all folds
