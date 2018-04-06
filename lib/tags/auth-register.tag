<graphjs-auth-register class={'root' + (opts.minor ? '' : ' box')}>
    <div class="header" if={opts.title}>
        <div class="title">{opts.title || 'Register'}</div>
    </div>
    <div class="warning" if={warningMessages.length > 0}>
        <ul if={warningMessages.length > 0} class="fail">
            <li each={warningMessage in warningMessages}>{warningMessage}</li>
        </ul>
    </div>
    <div class="content">
        <form>
            <input ref="username" type="text" placeholder="Choose a nickname"/>
            <input ref="email" type="text" placeholder="Enter email address"/>
            <input ref="password" type="password" placeholder="Set password"/>
            <input ref="confirmation" type="password" placeholder="Confirm password"/>
            <button ref="submit" onclick={handleSubmit}>Register</button>
            <div class="option single">
                <a data-link="login" onclick={opts.minor ? opts.callback : handleLoginBox}>Already a member?</a>
            </div>
        </form>
    </div>
    <a class="promo" href="http://graphjs.com">
        powered by <img src="lib/images/identity/logo.svg" />
    </a>
    <style type="less">
        @import '../styles/variables.less';
        @import '../styles/mixins.less';
        @import '../styles/options.less';
        @import '../styles/components/auth-register.less';
    </style>
    <script>
        import register from '../scripts/register.js';
        import login from '../scripts/login.js';
        import showAlert from '../scripts/showAlert.js';
        import showLogin from '../scripts/showLogin.js';

        this.handleLoginBox = () => showLogin();

        this.warningMessages = [];
        /*
        this.checkUsernameLength = () => {
            let warningMessage = 'Username is too short.';
            let usernameLength = 4;
            if(this.refs.username.value.length >= usernameLength) {
                this.refs.username.classList.remove('error');
                this.warningMessages.includes(warningMessage) && this.warningMessages.splice(this.warningMessages.indexOf(warningMessage), 1);
                return true;
            } else {
                this.refs.username.classList.add('error');
                this.warningMessages.includes(warningMessage) || this.warningMessages.push(warningMessage);
                return false;
            }
        }
        */
        this.checkUsernamePattern = () => {
            let warningMessage = 'Username is invalid. Valid characters are letters, numbers, hyphens, and underscores.';
            let usernamePattern = /^[a-zA-Z0-9-_]+$/;
            if(usernamePattern.test(this.refs.username.value)) {
                this.refs.username.classList.remove('error');
                this.warningMessages.includes(warningMessage) && this.warningMessages.splice(this.warningMessages.indexOf(warningMessage), 1);
                return true;
            } else {
                this.refs.username.classList.add('error');
                this.warningMessages.includes(warningMessage) || this.warningMessages.push(warningMessage);
                return false;
            }
        }
        this.checkEmailPattern = () => {
            let warningMessage = 'Email is invalid.';
            let emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
            if(emailPattern.test(this.refs.email.value)) {
                this.refs.email.classList.remove('error');
                this.warningMessages.includes(warningMessage) && this.warningMessages.splice(this.warningMessages.indexOf(warningMessage), 1);
                return true;
            } else {
                this.refs.email.classList.add('error');
                this.warningMessages.includes(warningMessage) || this.warningMessages.push(warningMessage);
                return false;
            }
        }
        /*
        this.checkPasswordLength = () => {
            let warningMessage = 'Password is too short.';
            let passwordLength = 4;
            if(this.refs.password.value.length >= passwordLength) {
                this.refs.password.classList.remove('error');
                this.warningMessages.includes(warningMessage) && this.warningMessages.splice(this.warningMessages.indexOf(warningMessage), 1);
                return true;
            } else {
                this.refs.password.classList.add('error');
                this.warningMessages.includes(warningMessage) || this.warningMessages.push(warningMessage);
                return false;
            }
        }
        */
        this.checkPasswordMatch = () => {
            let warningMessage = 'Passwords do not match.';
            if(this.refs.password.value == this.refs.confirmation.value) {
                this.refs.confirmation.classList.remove('error');
                this.warningMessages.includes(warningMessage) && this.warningMessages.splice(this.warningMessages.indexOf(warningMessage), 1);
                return true;
            } else {
                this.refs.confirmation.classList.add('error');
                this.warningMessages.includes(warningMessage) || this.warningMessages.push(warningMessage);
                return false;
            }
        }
        this.validateForm = () => {
            //let validUsernameLength = this.checkUsernameLength();
            let validUsernamePattern = this.checkUsernamePattern();
            let validEmailPattern = this.checkEmailPattern();
            //let validPasswordLength = this.checkPasswordLength();
            let validPasswordMatch = this.checkPasswordMatch();
            return (
                //validUsernameLength &&
                validUsernamePattern &&
                validEmailPattern &&
                //validPasswordLength &&
                validPasswordMatch
            ) ? true : false;
        }
        this.handleSubmit = (event) => {
            let self = this;
            event.preventDefault();
        	this.validateForm() && register(
        		self.refs.username.value,
        		self.refs.email.value,
        		self.refs.password.value,
                function(response) {
                    if(response.success) {
                        //Auto-Login
                        login(
                            self.refs.username.value,
                            self.refs.password.value,
                            function(response) {
                                if(response.success) {
                                    showAlert({
                                        title: 'Register Successful!',
                                        message: 'You are successfully registered and automatically logged in.'
                                    });
                                } else {
                                    showAlert({
                                        title: 'Register Successful!',
                                        message: 'Please login to continue.',
                                        customoption: 'Login',
                                        show: 'login',
                                        negativeoption: 'Cancel'
                                    });
                                }
                            }
                        );
                    } else {
                        showAlert({
                            title: 'Register Failed!',
                            message: response.reason || 'Please try registering again.',
                            customoption: 'Retry',
                            show: 'register',
                            negativeoption: 'Cancel'
                        });
                    }
                }
        	);
        }
    </script>
</graphjs-auth-register>