<docs-messages>
    <h1>{opts.label}</h1>
    <h2><{opts.component}></h2>
    <section class="demo" ref="liveDemo"></section>
    <section class="options">
        <form>
            <fieldset name="title">
                <legend>Title</legend>
                <input onclick={updateTextWithCheckbox} type="checkbox" checked={specs.title} />
                <input onkeyup={updateTextWithCheckbox} type="text" value={specs.title} />
            </fieldset>
            <fieldset name="minwidth">
                <legend>Minimum Width</legend>
                <input onclick={updateTextWithCheckbox} type="checkbox" checked={specs.minwidth} />
                <input onkeyup={updateTextWithCheckbox} type="text" value={specs.minwidth} />
            </fieldset>
            <fieldset name="maxwidth">
                <legend>Maximum Width</legend>
                <input onclick={updateTextWithCheckbox} type="checkbox" checked={specs.maxwidth} />
                <input onkeyup={updateTextWithCheckbox} type="text" value={specs.maxwidth} />
            </fieldset>
            <fieldset name="minheight">
                <legend>Minimum Height</legend>
                <input onclick={updateTextWithCheckbox} type="checkbox" checked={specs.minheight} />
                <input onkeyup={updateTextWithCheckbox} type="text" value={specs.minheight} />
            </fieldset>
            <fieldset name="maxheight">
                <legend>Maximum Height</legend>
                <input onclick={updateTextWithCheckbox} type="checkbox" checked={specs.maxheight} />
                <input onkeyup={updateTextWithCheckbox} type="text" value={specs.maxheight} />
            </fieldset>
            <xmp ref="inputCode" class="code">{input}</xmp>
            <button onclick={handleSubmit}>Apply</button>
        </form>
    </section>
    <script>
        this.input = '';
        this.specs = {}
        this.updateTextWithCheckbox = (event) => {
            let target = event.target.parentNode.name;
            if(event.target.type == 'checkbox') {
                let sibling = event.target.parentNode.children[2];
                event.target.checked ? this.specs[target] = sibling.value : delete this.specs[target];
            } else {
                let sibling = event.target.parentNode.children[1];
                this.specs[target] = event.target.value;
            }
            this.handleCode();
        }
        import updateCode from '../scripts/updateCode.js';
        import updateTag from '../scripts/updateTag.js';
        this.handleCode = () => {
            updateCode(opts.component, this.specs, this.refs.inputCode);
        }
        this.handleSubmit = (event) => {
            event.preventDefault();
            updateTag(opts.component, this.specs, this.refs.liveDemo);
        }
        this.on('mount', function() {
            updateCode(opts.component, this.specs, this.refs.inputCode);
            updateTag(opts.component, this.specs, this.refs.liveDemo);
        })
    </script>
</docs-messages>