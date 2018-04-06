<graphjs-forum
    class="box"
    style={
        (opts.minwidth ? 'min-width: ' + opts.minwidth + '; ' : '') +
        (opts.maxwidth ? 'max-width: ' + opts.maxwidth + '; ' : '') +
        (opts.minheight ? 'min-height: ' + opts.minheight + '; ' : '') +
        (opts.maxheight ? 'max-height: ' + opts.maxheight + '; ' : '')
    }
>
    <graphjs-forum-list
        minor={true}
        title={opts.title}
        access={opts.access}
        callback={changeProperties}
        if={this.active == 'list'}
    />
    <graphjs-forum-thread
        minor={true}
        title={opts.title}
        access={opts.access}
        id={id}
        callback={changeProperties}
        if={this.active == 'thread'}
    />
    <graphjs-forum-compose
        minor={true}
        title={opts.title}
        callback={changeProperties}
        if={this.active == 'compose'}
    />
    <style type="less">
        @import '../styles/variables.less';
        @import '../styles/mixins.less';
        @import '../styles/options.less';
        @import '../styles/components/forum.less';
    </style>
    <script>
        import './forum-list.tag'
        import './forum-thread.tag'
        import './forum-compose.tag'

        this.active = 'list';
        this.id = undefined;
        this.changeProperties = (properties) => {
            this.active = properties.link || undefined;
            this.id = properties.id || undefined;
            this.update();
        }
    </script>
</graphjs-forum>