$(function() {
    
    setCharAt = (str,index,chr) => {
        if(index > str.length-1) return str;
        return str.substr(0,index) + chr + str.substr(index+1);
    }

    onEnterSmsCode = (input, idx, focusNextName, event, hiddenFieldName) => {
        console.log("onChangeSmsCode", idx, event);

        // remove anything except numbers and only allow a single character
        input.value = input.value.replace(/[^\d]/g, '');
        if (input.value.length) {
            input.value = input.value[input.value.length - 1];
        }

        if (input.value.length <= 0) {
            return;
        }

        // update hidden field
        var hiddenField = document.getElementsByName(hiddenFieldName)[0];
        hiddenField.value = setCharAt(hiddenField.value, idx, input.value);
        
        var elements = document.getElementsByName(focusNextName);
        if (elements.length) {
            var focusNextElement = elements[0];
            focusNextElement.focus();
            focusNextElement.select();
        }
    }
});
