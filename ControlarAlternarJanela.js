<script>
        (function () {
            var count = 0;
            var hidden = "hidden";
            if (hidden in document) document.addEventListener("visibilitychange", onchange);
            else if ((hidden = "mozHidden") in document) document.addEventListener("mozvisibilitychange", onchange);
            else if ((hidden = "webkitHidden") in document) document.addEventListener("webkitvisibilitychange", onchange);
            else if ((hidden = "msHidden") in document) document.addEventListener("msvisibilitychange", onchange);
            else if ('onfocusin' in document) document.onfocusin = document.onfocusout = onchange;
            else window.onpageshow = window.onpagehide = window.onfocus = window.onblur = onchange;

            function onchange(evt) {
                var evtMap = {
                    focus: true,
                    focusin: true,
                    pageshow: true,
                    blur: false,
                    focusout: false,
                    pagehide: false
                };

                evt = evt || window.event;
                if (evt.type in evtMap) evtMap[evt.type] ? functionVisible() : functionHidden();
                else this[hidden] ? functionHidden() : functionVisible();
            }
            var s_item = "";
            
            function functionVisible() {
                console.log('Visible');
                //alert(JSON.parse(localStorage.getItem(s_item)));
                var count = JSON.parse(localStorage.getItem(s_item));
                count++;
                
                if (count > 5) {
                    window.location.href = "info.aspx";
                    localStorage.setItem(s_item, 0);
                    return;
                }
                localStorage.setItem(s_item, count);

                window.location.reload();

            }

            function functionHidden() {
                console.log('Hidden');
            }
        })();

</script>
    