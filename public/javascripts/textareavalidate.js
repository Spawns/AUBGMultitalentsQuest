function DjCheckMaxlength(oInObj , displayObj)
{
    var iMaxLen = parseInt(oInObj.getAttribute('maxlength'));
    var iCurLen = oInObj.value.length;

    $('#' + displayObj).html(iCurLen + " / " + iMaxLen);

    if ( oInObj.getAttribute && iCurLen > iMaxLen )
    {
        oInObj.value = oInObj.value.substring(0, iMaxLen);
    }


}