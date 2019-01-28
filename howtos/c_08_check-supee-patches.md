# Check SUPEE patches
## Check patch
1. get codebase
2. get patch and open in vim
3. mark start/end of which files were modified. `ma, mb`
4. copy that portion to .patch file with `:'a,'b w {{filename}}.patch`
5. cd to codebase
6. use Patch_Checker.sh, pass in filepath to patch file (make sure there are no spaces in the path)

## Check magereport.com 

## SUPEE-8788
	removed:
		skin/adminhtml/default/default/media/flex.swf
		skin/adminhtml/default/default/media/uploader.swf
		skin/adminhtml/default/default/media/uploaderSingle.swf
	skin/adminhtml/defaul/default/boxes.css
		~line 81 background:url(images/blank.gif) repeat;
		grep "^\s*background:url.*blank\.gif" skin/adminhtml/default/default/boxes.css
	js/mage/adminhtml/uploader/instance.js
		EOF fustyFlowFactory
		grep fusty js/mage/adminhtml/uploader/instance.js


