<graphjs-forum-list class={'root' + (opts.minor ? '' : ' box') + (loaded ? '' : ' loading') + (blocked ? ' blocked' : '')} onclick={blocked ? handleBlock : ''}>
    <div class="header">
        <div class="title">{opts.title || 'Community Forum'}</div>
    </div>
    <div class="content">
        <div class="bar">
            <div class="search">
                <div class="icon">
                    <svg viewBox="0 0 20 20" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                        <g transform="translate(-15.000000, -15.000000)" fill="black" fill-rule="nonzero">
                            <path d="M20.7680925,17.4466286 C17.9916599,20.2182136 17.582728,24.4722742 19.5628195,27.6735622 L15.5811138,31.6483159 C14.8062954,32.4217814 14.8062954,33.6464353 15.5811138,34.4199008 C16.3559322,35.1933664 17.582728,35.1933664 18.3575464,34.4199008 L22.3177294,30.4666324 C25.5246166,32.4217814 29.7861178,32.0350486 32.5625504,29.2634637 C35.8124832,26.0192053 35.8124832,20.7338573 32.5625504,17.4681138 C29.3126177,14.1808851 24.0180253,14.1808851 20.7680925,17.4466286 Z M30.1304816,26.7926709 C28.2149583,28.7048497 25.094162,28.7048497 23.1786387,26.7926709 C21.2631154,24.8804921 21.2631154,21.7651447 23.1786387,19.8529659 C25.094162,17.9407872 28.2149583,17.9407872 30.1304816,19.8529659 C32.0460048,21.7866298 32.0460048,24.8804921 30.1304816,26.7926709 Z" id="Shape" transform="translate(25.000000, 25.000000) scale(-1, 1) translate(-25.000000, -25.000000) "></path>

                        </g>
                    </svg>
                </div>
                <input onkeyup={handleFilter} type="text" placeholder="Search in posts..." />
            </div>
            <button data-link="compose" onclick={opts.minor ? handleCallback : handleShow}>
                <svg viewBox="0 0 21 20" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                    <g transform="translate(-20.000000, -17.000000)" fill="black" fill-rule="nonzero">
                        <path d="M38.1489476,17 L22.6361271,17 C21.3968108,17 20.3925373,18.0239842 20.3925373,19.2876244 L20.3925373,30.4860904 C20.3925373,31.7497305 21.3968108,32.7737148 22.6361271,32.7737148 L24.7515117,32.7737148 L24.7515117,36.5428483 C24.7515117,36.9132256 25.1574946,37.1310946 25.4566399,36.9132256 L31.4609134,32.7737148 L38.1489476,32.7737148 C39.3882638,32.7737148 40.3925373,31.7497305 40.3925373,30.4860904 L40.3925373,19.2876244 C40.3925373,18.0239842 39.3882638,17 38.1489476,17 Z M31.2728027,25.8802653 L31.2728027,28.6472015 L29.1594735,28.6472015 L29.1594735,25.8802653 L26.3925373,25.8802653 L26.3925373,23.7669362 L29.1594735,23.7669362 L29.1594735,21 L31.2728027,21 L31.2728027,23.7669362 L34.0397388,23.7669362 L34.0397388,25.8802653 L31.2728027,25.8802653 Z"></path>
                    </g>
                </svg>
                New Thread
            </button>
        </div>
        <div class="list">
            <a each={matchedThread in matchedThreads} class="item" data-link="thread" data-id={matchedThread} onclick={opts.minor ? handleCallback : handleShow} if={matchedThreads.length > 0}>
                <div class="title">
                    {threadsData[matchedThread] && threadsData[matchedThread].title}
                </div>
                <div class="views" if={threadsData[matchedThread].views}>
                    <svg viewBox="0 0 19 12" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                        <path transform="translate(0.000000, -19.000000)" d="M18.5059451,24.5206612 C16.1180812,21.0826446 12.8730354,19 9.32185322,19 C5.77067104,19 2.52562526,21.1157025 0.137761378,24.5206612 C-0.0459204592,24.8181818 -0.0459204592,25.1818182 0.137761378,25.4793388 C2.52562526,28.9173554 5.77067104,31 9.32185322,31 C12.8730354,31 16.1180812,28.8842975 18.5059451,25.4793388 C18.7202405,25.1818182 18.7202405,24.785124 18.5059451,24.5206612 Z M13.2403991,25.2479339 C13.1179445,27.3636364 11.5260353,29.0826446 9.56676233,29.214876 C7.2095121,29.3801653 5.25023917,27.2644628 5.40330737,24.7190083 C5.52576192,22.6033058 7.11767118,20.8842975 9.0769441,20.7520661 C11.4341943,20.5867769 13.3934673,22.7024793 13.2403991,25.2479339 Z M11.4341943,25.1157025 C11.3729671,26.2396694 10.5157852,27.1652893 9.47492142,27.231405 C8.18914856,27.3305785 7.14828482,26.1735537 7.24012573,24.8181818 C7.30135301,23.6942149 8.15853492,22.768595 9.19939866,22.7024793 C10.4545579,22.6033058 11.5260353,23.7603306 11.4341943,25.1157025 Z"></path>
                    </svg>
                    {threadsData[matchedThread].views}
                </div>
                <time data-time={threadsData[matchedThread] && threadsData[matchedThread].timestamp}>
                    {threadsData[matchedThread] && handleTime(threadsData[matchedThread].timestamp)}
                </time>
            </a>
            <div class="placeholder item" if={matchedThreads.length <= 0}>
                There isn't any thread available.
            </div>
        </div>
    </div>
    <a class="promo" href="http://graphjs.com">
        powered by <img src="lib/images/identity/logo.svg" />
    </a>
    <style type="less">
        @import '../styles/variables.less';
        @import '../styles/mixins.less';
        @import '../styles/options.less';
        @import '../styles/components/forum-list.less';
    </style>
    <script>
        import getUser from '../scripts/getUser.js';
        import getThreads from '../scripts/getThreads.js';
        import showForumCompose from '../scripts/showForumCompose.js';
        import showForumThread from '../scripts/showForumThread.js';
        import showLogin from '../scripts/showLogin.js';

        this.blocked = false;
        this.access = opts.access || 'public';
        this.threads = [];
        this.threadsData = {};
        this.matchedThreads = [];

        this.on('before-mount', function() {
            this.handleUser();
            this.handleContent();
        });

        this.handleUser = () => {
            let self = this;
            getUser(function(response) {
                if(response.success) {
                    self.userId = response.id;
                    self.loaded = true;
                    self.update();
                } else {
                    if(self.access != 'private') {
                        self.loaded = true;
                    } else {
                        self.loaded = false;
                        self.blocked = true;
                    }
                    self.update();
                    //Handle errors
                }
            });
        }
        this.handleBlock = (event) => {
            event.preventDefault();
            showLogin();
        }
        this.handleContent = () => {
            let self = this;
            getThreads(function(response) {
                if(response.success) {
                    for(let thread of response.threads) {
                        self.threads.push(thread.id);
                        self.threadsData[thread.id] = {
                            id: thread.id,
                            title: thread.title,
                            author: thread.author,
                            //views: 1317, //MAKE THIS DYNAMIC
                            timestamp: thread.timestamp,
                            contibutors: thread.contributors //NOT PRINTED FOR NOW
                        }
                    }
                    self.matchedThreads = self.threads;
                    self.update();
                } else {
                    //Handle error
                }
            });
        }
        this.handleCallback = (properties) => {
            if(properties.target) {
                properties.preventDefault();
                let dataset = Object.assign({}, properties.currentTarget.dataset);
                opts.callback(dataset);
            } else {
                opts.callback(properties);
            }
        }
        this.handleShow = (event) => {
            event.preventDefault();
            let dataset = event.currentTarget.dataset;
            switch(dataset.link) {
                case 'compose':
                    showForumCompose();
                    break;
                case 'thread':
                    showForumThread({
                        id: dataset.id
                    });
                    break;
            }
        }
        this.handleFilter = (event) => {
            let self = this;
            self.matchedThreads = self.threads.filter(item => self.threadsData[item].title.startsWith(event.target.value));
        }
        this.handleTime = (timestamp) => {
            let time = timestamp * 1000;
            let passedTime = Math.floor((Date.now() - time) / 1000);
            let date = new Date(time);
            if(passedTime < 60 * 60 * 24) {
                return date.getHours() + ':' + ((date.getMinutes() < 10 ? '0' : '') + date.getMinutes());
            } else if(passedTime >= 60 * 60 * 24 && passedTime < 60 * 60 * 24 * 365) {
                return this.months[date.getMonth()].substring(0, 3) + ', ' + date.getDate();
            } else {
                return this.months[date.getMonth()].substring(0, 3) + ' \'' + date.getFullYear().toString().substring(2, 4);
            }
        }
        this.months = [
            'January',
            'February',
            'March',
            'April',
            'May',
            'June',
            'July',
            'August',
            'September',
            'October',
            'November',
            'December'
        ];
    </script>
</graphjs-forum-list>