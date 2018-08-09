

const NATIVE_CLASS = '.ynews-native-module'

class YNewsNativeModule {
    constructor(node) {
        this.node = node;
        this.kind = node.getAttribute('data-ynews-kind');
        this.data = node.getAttribute('data-ynews-data');
        this.lastX = 0;
        this.lastY = 0;
        this.lastW = 0;
        this.lastH = 0;
    }

    static isValidNode(domNode) {
        return !!(domNode && node.getAttribute('data-ynews-kind') && node.getAttribute('data-ynews-data'))
    }

    changeString() {
        // '|:|'
    }
}

class YNews {

    constructor() {
        this.nativeObjs = []
    }

    sendMessage() {
        let handler = window.webkit &&
            window.webkit.messageHandlers &&
            window.webkit.messageHandlers.positionChange;
        if (handler) {
            var obj = document.querySelector('#test1');
            var msg = '{{'+obj.offsetLeft+','+obj.offsetTop+'},{'+obj.offsetWidth+','+obj.offsetHeight+'}}';
            handler.postMessage(msg);
        }
    }
    onPositionChange(objs, millis, callback) {
        if (millis == null) millis = 200;
        if (!obj) { return; }
        
        var lastX = 0;
        var lastY = 0;
        var lastW = 0;
        var lastH = 0;

        setInterval( () => {
            if (!obj) { return; }
            let newX = obj.offsetLeft
            let newY = obj.offsetTop
            let newW = obj.offsetWidth
            let newH = obj.offsetHeight
            if (lastX != newX || lastY != newY || lastW != newW || lastH != newH) {
                lastX = newX
                lastY = newY
                lastW = newW
                lastH = newH
                callback(obj)
            }
        }, millis);
        return obj;
    }


    subscribe(millis) {
        const nodes = document.querySelector(NATIVE_CLASS)
        if (!modules.length) {
            return;
        }
        nodes.forEach(node => {
            if (YNewsNativeModule.isValidNode(node)) {
                this.nativeObjs.push(new YNewsNativeModule(node));
            }
        });

    }

}




window.YNEWS.onPositionChange(document.querySelector('#test1'), 100, ()=>{
    window.YNEWS.sendMessage();
});


window.YNEWS = window.YNEWS || new YNews()