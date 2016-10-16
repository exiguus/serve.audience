#
# Methods placed in this module can be used inside of any view.
# View helpers allow you to encapsalate complex logic and keep your
# views pristine.
#
module ViewHelpers

  def author()
    author =
      {
        :authorname => "Simon Gattner",
        :authorurl => "http://gattner.name/simon",
        :date => "2015-07-26",
        :update => "2016-10-15",
        :version => "0.5",
      }
  end

  def dict()
    dict =
      [
        { :name => "toc", :value => "Table of content" },
        { :name => "toc-alias", :value => "TOC" },
        { :name => "main-nav", :value => "Main Navigation" },
        { :name => "home-page", :value => "Home Page" },
        { :name => "next-page", :value => "Next Page" },
        { :name => "prev-page", :value => "Prev Page" },
        { :name => "first-slide", :value => "First Slide" },
        { :name => "next-slide", :value => "Next Slide" },
        { :name => "prev-slide", :value => "Prev Slide" },
        { :name => "jump-to", :value => "Jumb to" },
        { :name => "jump-to-top", :value => "Jumb to the top of the page" },
        { :name => "go-to-start", :value => "Go to the Start Page" },
        { :name => "print-version", :value => "Print / Single Version" },
        { :name => "top", :value => "Top" },
        { :name => "home", :value => "Home" },
        { :name => "sitemap", :value => "Sitemap" },
        { :name => "title", :value => "Title" },
        { :name => "date", :value => "Date" },
        { :name => "update", :value => "Update" },
        { :name => "version", :value => "Version" },
        { :name => "author", :value => "Author" }
      ]
  end

  def project()
    project =
      {
        :title => "Atom Frontend Development",
        :image => "atom-logo.png",
        :subtitle => "An introduction to Atom (comparing Atom and Sublime / two modern Text Editor for frontend development).",
        :description => "A short introduction into Atom Text Editor from the perspective of a frontend developer. See the pros and cons of Atom 1.0.2 and Sublime 2.",
        :tags => "Atom, Sublime, Text Editor, Frontend, Development",
      }
  end

  # table of content
  def categories()
    #sorted categories and items
    # categories
    ## items
    ### headline
    ###
      #  {
      #    :id => "category",
      #    :name => "Category",
      #    :title => "Category",
      #    :image => "",
      #    :description => "Description",
      #    :tags => "category, tags",
      #    :items => [
      #              {
      #                :id => "name1",
      #                :name => "name1",
      #                :title => "Name One",
      #                :image => "image.png",
      #                :text => 'Text item one'
      #                :tags => "item, one",
      #                :visible => true
      #              },
      #              {
      #                :id => "name2",
      #                :name => "Name2",
      #                :title => "Name two",
      #                :image => "",
      #                :text => '
      #  <h4>Text item two</h4>
      #  <p>Lorem Ipsum Text</p>
      #                ',
      #                :tags => "item, two",
      #                :visible => true
      #              },
      #              ]
      #  },
      categories = [
        {
          :id => "index",
          :name => "Intro",
          :title => "Introducing Atom Text Editor",
          :image => "atom-text-editor-welcome.png",
          :description => '<p>A hackable text editor for the 21st Century</p>',
          :tags => "Atom, Text Editor, Introduction",
          :items => []
        },
        {
          :id => "about",
          :name => "About",
          :title => "About Atom Text Editor",
          :image => "",
          :description => '<p>
                              Atom is a modern text editor ready to use productively.<br />
                              Atom is a desktop application built with HTML, JavaScript, CSS, and Node.js integration.<br />
                              It runs on <a href="http://electron.atom.io/" title="Electron Framework">Electron</a>, a framework for building cross platform apps using web technologies.
                          </p>',
          :tags => "about, Atom, Electron, Framework",
          :items => [
                    {
                      :id => "architecture",
                      :name => "Architecture",
                      :title => "Architecture",
                      :image => "",
                      :text => '<p>
                                    Atom is based on Chromium, <a href="https://github.com/Squirrel/Squirrel.Windows" title="Squirrel Install Tool">Squirrel</a>, Node.js, JavaScript / CoffeeScript, Json and CSS / less.
                                </p>
                                <p>
                                  Atom is a specialized variant of Chromium designed to be a text editor rather than a web browser.<br />
                                  For example, the layout of our workspace and panes is based on flexbox.<br />
                                  Every Atom window is essentially a locally-rendered web page.
                                </p>
                                <p>
                                  All the APIs available to a typical Node.js application are also available to the code running in each window’s JavaScript context.
                                </p>',
                      :tags => "architecture, chromium, node.js, css, html, javascript",
                      :visible => true
                    },
                    {
                      :id => "features",
                      :name => "features",
                      :title => "Features",
                      :image => "",
                      :text => '<ul>
                                  <li>Built-in package manager <kbd>ctrl-comma</kbd></li>
                                  <li>Smart autocompletion <kbd>ctrl-space</kbd></li>
                                  <li>File system browser <kbd>ctrl-o</kbd>/<kbd>ctrl-shift-o</kbd></li>
                                  <li>Multiple panes to compare and edit code <kbd>cmd-k arrow</kbd></li>
                                  <li>Find and replace <kbd>cmd-f</kbd>/<kbd>cmd-shift-f</kbd></li>
                                  <li>Snippets <kbd>alt-shift-S</kbd></li>
                                  <li>Version control <kbd>cmd-alt-Z</kbd></li>
                                  <li>Spell checking <kbd>cmd-:</kbd></li>
                                </ul>',
                      :tags => "packages, keybindings, spell checking, find, replace",
                      :visible => true
                    },
                    {
                      :id => "cummunity",
                      :name => "cummunity",
                      :title => "Community",
                      :image => "",
                      :text => '<p>
                                    There are over 1000 open source packages and themes. Because of Open Source there is a very large community.
                                </p>
                                <ul>
                                  <li>Packages <a class="plain" href="https://atom.io/packages" title="over 1000 open source packages ">https://atom.io/packages</a></li>
                                  <li>Themes <a class="plain" href="https://atom.io/themes" title="UI and Syntax- Themes ">https://atom.io/themes</a></li>
                                  <li>Open Source <a class="plain" href="https://github.com/atom/atom" title="Github">https://github.com/atom/atom</a></li>
                                  <li>Discuss and Slack <a class="plain" href="http://discuss.atom.io/" title="Discuss Forum">http://discuss.atom.io/</a>, <a class="plain" href="http://atom-slack.herokuapp.com/" title="Slack Group">http://atom-slack.herokuapp.com/</a></li>
                                </ul>',
                      :tags => "packages, themes, community, discuss, slack, forum",
                      :visible => true
                    },
                    {
                      :id => "platform",
                      :name => "platform",
                      :title => "Platform",
                      :image => "",
                      :text => '<p>
                                  <a href="http://flight-manual.atom.io/getting-started/sections/installing-atom/" title="Installer">Install Atom</a> on OS X, Windows and Linux<br />
                                </p>',
                      :tags => "install, os x, linux, windows",
                      :visible => true
                    },
                    {
                      :id => "licence",
                      :name => "licence",
                      :title => "Licence",
                      :image => "",
                      :text => '<p>
                                  Atom is Open Source and published under Github MIT Licence.
                                </p>
                                <p>
                                  It is a long-term investment, and GitHub will continue to support its development with a dedicated team going forward.<br />
                                  Emacs and Vim already have demonstrated over the past three decades, that if you want to build a thriving, long-lasting community around a text editor, it has to be open source.
                                </p>
                                ',
                      :tags => "licence, mit, open source, github",
                      :visible => true
                    },
                    ]
          },
          {
            :id => "usage",
            :name => "Usage",
            :title => "Use the Atom Text Editor",
            :image => "",
            :description => '<iframe width="560" height="315" src="https://www.youtube.com/embed/U5POoGSrtGg" frameborder="0" allowfullscreen></iframe>',
            :tags => "usage, documentation, settings, api, themes",
            :items => [
                    {
                      :id => "documentation",
                      :name => "documentation",
                      :title => "Documentation",
                      :image => "",
                      :text => '
                                <h4>Atom Flight Manual</h4>
                                <ul>
                                  <li>Using and hacking Atom <a class="plain" href="http://flight-manual.atom.io/" title="Atom Documentation">http://flight-manual.atom.io/</a></li>
                                  <li>Install Atom <a class="plain" href="http://flight-manual.atom.io/getting-started/sections/installing-atom/" title="Atom Install">http://flight-manual.atom.io/getting-started/sections/installing-atom/</a></li>
                                  <li>Configuration and setting <a class="plain" href="http://flight-manual.atom.io/using-atom/" title="Atom Settings">http://flight-manual.atom.io/using-atom/</a></li>
                                </ul>
                                <p>Press <kbd>cmd-shift-P</kbd> to show the Command Palette</p>

                                <p>Don\'t forget that atom is a desktop application built with HTML; JavaScript, CSS and Node.js</p>

                                <h4>API Reference</h4>
                                <p>Atom global for dealing with packages, themes, menus, and the window.</p>
                                <p>Using the API <a class="plain" href="http://flight-manual.atom.io/upgrading-to-1-0-apis/" title="Atom API">http://flight-manual.atom.io/upgrading-to-1-0-apis/</a></p>
                                ',
                      :tags => "manual, api, documentation",
                      :visible => true
                    },
                    {
                      :id => "configuration",
                      :name => "Configuration",
                      :title => "Configuration",
                      :image => "atom-settings.png",
                      :text => '<h4>Settings <kbd>ctrl-comma</kbd></h4>
                                <p>Edit core config settings, install and configure packages, and change themes all from within Atom.</p>
                                <p>
                                  Basic settings and configuration <a class="plain" href="http://flight-manual.atom.io/using-atom/" title="Basics">http://flight-manual.atom.io/using-atom/</a>
                                </p>',
                      :tags => "configuration, settings",
                      :visible => true
                    },
                    {
                      :id => "customization",
                      :name => "customization",
                      :title => "Customization",
                      :image => "atom-custom.png",
                      :text => '<ul>
                                  <li>Style Tweaks using CSS and less</li>
                                  <li>Customizing Key Bindings</li>
                                  <li>Language Specific Configuration Settings</li>
                                </ul>
                                <p>
                                  Basic Customization <a class="plain" href="http://flight-manual.atom.io/using-atom/sections/basic-customization/" title="Basics">http://flight-manual.atom.io/using-atom/sections/basic-customization/</a>
                                </p>',
                      :tags => "customization, keybindings, tweaks",
                      :visible => true
                    },
                    {
                      :id => "packages",
                      :name => "Packages",
                      :title => "Packages",
                      :image => "atom-packages.png",
                      :text => '<p>
                                  Atom Package Directory <a class="plain" href="https://atom.io/packages" title="Package Directory">https://atom.io/packages</a>
                                </p>
                                <h4>Howto install and configure packages</h4>
                                <p>Atom has an integrated Package Manager <a class="plain" href="http://flight-manual.atom.io/using-atom/sections/atom-packages/" title="Using Atom Packages">http://flight-manual.atom.io/using-atom/sections/atom-packages/</a></p>
                                <ul>
                                  <li>Search the Package Directory within Atom</li>
                                  <li>Install packages like browser add-ons</li>
                                  <li>Configure packages like browser add-ons</li>
                                </ul>
                                <p>There is also an option to install packages with the command line <kbd>apm install &lt;package_name&gt;</kbd></p>
                                <p>Write your own package <a class="plain" href="http://flight-manual.atom.io/hacking-atom/sections/package-word-count/" title="Example Package">http://flight-manual.atom.io/hacking-atom/sections/package-word-count/</a></p>
                                ',
                      :tags => "package, install, manager",
                      :visible => true
                    },
                    {
                      :id => "themes",
                      :name => "themes",
                      :title => "Themes",
                      :image => "atom-themes.png",
                      :text => '<p>
                                  Atom Themes are like Atom Packages. They can be searched and setup in the Theme Manager or within <em>Open Your Stylesheet</em> context.
                                </p>
                                <p>
                                  Creating a Theme <a class=plain href="http://flight-manual.atom.io/hacking-atom/sections/creating-a-theme/" title="Create a Atom Theme">http://flight-manual.atom.io/hacking-atom/sections/creating-a-theme/</a>
                                </p>',
                      :tags => "theme, install, manager",
                      :visible => true
                    },
                    ]
        },
        {
          :id => "summary",
          :name => "Summary",
          :title => "Summary",
          :image => "",
          :description => "Atom is open and for free. Atom has a popular look and feel. Atom is flexible and always up to date. Atom is written in technics a web developer should know.",
          :tags => "summary, resume, pro",
          :items => [
                    {
                      :id => "pro",
                      :name => "Pro",
                      :title => "Pro",
                      :image => "",
                      :text => '
                              <ul>
                                <li>flexible
                                  <ul>
                                    <li>simple setup and configuration</li>
                                    <li>easy to write my own (color-)themes with less and CoffeeScript</li>
                                  </ul>
                                </li>
                                <li>hackable
                                  <ul>
                                    <li>easy to configure and customize</li>
                                    <li>easy to write my own packages</li>
                                  </ul>
                                </li>
                                <li>usable
                                  <ul>
                                    <li>very good autocomplete</li>
                                    <li>easy to find, update and install packages</li>
                                    <li>lot of packages and themes from the community</li>
                                    <li>well known Key Bindings</li>
                                  </ul>
                                </li>
                                <li>frontend desktop app
                                  <ul>
                                    <li>easy to understand for frontend developer</li>
                                  </ul>
                                </li>
                                <li>open source
                                  <ul>
                                    <li>free as in freedom</li>
                                    <li>use and modify without restrictions</li>
                                  </ul>
                                </li>
                              </ul>',
                      :tags => "pro, atom",
                      :visible => true
                    },
                    {
                      :id => "contra",
                      :name => "Contra",
                      :title => "Contra",
                      :image => "",
                      :text => '
                              <ul>
                                <li>slow sometimes
                                  <ul>
                                    <li>because it is a web technology based desktop app it is not written in c++</li>
                                    <li>sometimes you have to reload the editor</li>
                                  </ul>
                                </li>
                                <li>brand new
                                  <ul>
	                                   <li>sometimes buggy</li>
                                     <li>like: you need the keyboard-localization package for \ and @ alt-gr + (q|\) in the first versions</li>
                                  </ul>
                                </li>
                              </ul>',
                      :tags => "contra, atom",
                      :visible => true
                    }
                    ]
        },
        {
          :id => "compare",
          :name => "Compare",
          :title => "Compare",
          :image => "",
          :description => "Atom versus Sublime",
          :tags => "compare, pro, contra, versus",
          :items => [
                    {
                      :id => "ui",
                      :name => "ui",
                      :title => "Userinface",
                      :image => "atom-vs-sublime.gif",
                      :text => 'Very similar user interface of Atom and Sublime with the same Key Bindings',
                      :tags => "",
                      :visible => true
                    },
                    {
                      :id => "compare",
                      :name => "compare",
                      :title => "Compare",
                      :image => "",
                      :text => '
                      <h4>Compare Atom 1.10 and Sublime 2</h4>
                      <table>
                        <thead>
                          <tr>
                            <th>

                            </th>
                            <th>
                              Sublime
                            </th>
                            <th>
                              Atom
                            </th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <th>
                              Platform
                            </th>
                            <td>
                              OS X, Windows and Linux
                            </td>
                            <td>
                              OS X, Windows and Linux
                            </td>
                          </tr>
                          <tr>
                            <th>
                              Architecture
                            </th>
                            <td>
                              C++, Phyton Plugins
                            </td>
                            <td>
                              Chromium, Node.js, HTML, CSS, JavaScript (CoffeeScript) Plugins
                            </td>
                          </tr>
                          <tr>
                            <th>
                              Package Manager
                            </th>
                            <td>
                              3rd part <a href="https://packagecontrol.io/" title="packagecontrol.io">Packagecontrole</a>
                            </td>
                            <td>
                              core
                            </td>
                          </tr>
                          <tr>
                            <th>
                              Autocompletion
                            </th>
                            <td>
                              <a href="https://packagecontrol.io/packages/Emmet" title="Emmet on packagecontrol.io">Emmet</a> Plugin
                            </td>
                            <td>
                              core, <a href="https://atom.io/packages/emmet" title="Atom Emmet Plugin">Emmet</a> is also available
                            </td>
                          </tr>
                          <tr>
                            <th>
                              Version Controle
                            </th>
                            <td>
                              git, svn and mercurial plugins
                            </td>
                            <td>
                              core git and svn, mercurial plugins
                            </td>
                          </tr>
                          <tr>
                            <th>
                              File combine
                            </th>
                            <td>
                              <a href="http://www.sublimerge.com/" title="Sublime Merge Plugin">sublimerge</a> plugin
                            </td>
                            <td>
                              core
                            </td>
                          </tr>
                          <tr>
                            <th>
                              Panes
                            </th>
                            <td>
                              core colums
                            </td>
                            <td>
                              core multiple
                            </td>
                          </tr>
                          <tr>
                            <th>
                              Configuration
                            </th>
                            <td>
                              JSON
                            </td>
                            <td>
                              UI + HTML, JavaScript (CoffeeScript) and CSS
                            </td>
                          </tr>
                          <tr>
                            <th>
                              Documentation
                            </th>
                            <td>
                              minimal core documentation and larger 3rd part <a href="http://sublime-text-unofficial-documentation.readthedocs.org/en/sublime-text-2/index.html" title="Sublime Documentation">unoffical documentation</a>
                            </td>
                            <td>
                              full documentation
                            </td>
                          </tr>
                          <tr>
                            <th>
                              Licence
                            </th>
                            <td>
                              License Key $70 per user (free unlimited trail with purchase message from time to time)
                            </td>
                            <td>
                              MIT
                            </td>
                          </tr>
                          <tr>
                            <th>
                              Community
                            </th>
                            <td>
                              forum, userecho and technical support
                            </td>
                            <td>
                              open source, github, discuss and slack
                            </td>
                          </tr>
                          <tr>
                            <th>
                              Philosophy
                            </th>
                            <td>
                              closed source
                            </td>
                            <td>
                              open source
                            </td>
                          </tr>
                          <tr>
                            <th>
                              Releases
                            </th>
                            <td>
                              slow
                            </td>
                            <td>
                              weekly
                            </td>
                          </tr>
                          <tr>
                            <th>
                              <abbr title="User Interface">UI</abbr>
                            </th>
                            <td>
                              traditional
                            </td>
                            <td>
                              similar to Sublime, same Key Bindings as Sublime
                            </td>
                          </tr>
                          <tr>
                            <th>
                              Performance
                            </th>
                            <td>
                              fast and stable
                            </td>
                            <td>
                              sometimes slow, a lot of RAM
                            </td>
                          </tr>
                        </tbody>
                      </table>',
                      :tags => "compare, sublime, atom",
                      :visible => true
                    },
                    ]
        },
        {
          :id => "keybindings",
          :name => "Keybindings",
          :title => "Keybindings",
          :image => "",
          :description => "Atom Keyboard Shortcuts",
          :tags => "keyboard, key, keybindings, shortcuts",
          :items => [
                    {
                      :id => "general",
                      :name => "General",
                      :title => "General",
                      :image => "",
                      :text => '
                      <dl>
                          <dt><kbd>shift + ⌘ + p</kbd></dt>
                          <dd>Toggle command palette</dd>
                          <dt><kbd>⌘ + /</kbd></dt>
                          <dd>Toggle line/selection comment</dd>
                          <dt><kbd>ctrl + space</kbd></dt>
                          <dd>Show available auto-completions</dd>
                      </dl>
                      ',
                      :tags => "",
                      :visible => true
                    },
                    {
                      :id => "filenavigation",
                      :name => "File Navigation",
                      :title => "File Navigation",
                      :image => "",
                      :text => '
                      <dl>
                          <dt><kbd>⌘ + p</kbd></dt>
                          <dd>Toggle file finder</dd>
                          <dt><kbd>ctrl + g</kbd></dt>
                          <dd>Goto line</dd>
                          <dt><kbd>⌘ + r</kbd></dt>
                          <dd>Goto symbol</dd>
                          <dt><kbd>shift + ⌘ + { / }</kbd></dt>
                          <dd>Previous/next file</dd>
                          <dt><kbd>⌘ + F2</kbd></dt>
                          <dd>Set bookmark</dd>
                          <dt><kbd>F2</kbd></dt>
                          <dd>Goto next bookmark</dd>
                      </dl>
                      ',
                      :tags => "",
                      :visible => true
                    },
                    {
                      :id => "windowmanipultation",
                      :name => "Window Manipulation",
                      :title => "Window Manipulation",
                      :image => "",
                      :text => '
                      <dl>
                          <dt><kbd>⌘ + \</kbd></dt>
                          <dd>Toggle tree-view sidebar</dd>
                          <dt><kbd>ctrl + ⌘ + f</kbd></dt>
                          <dd>Toggle fullscreen</dd>
                          <dt><kbd>⌘ + k, left/right/up/down</kbd></dt>
                          <dd>Split pane left/right/up/down</dd>
                          <dt><kbd>⌘ + k, ⌘ + left/right/up/down</kbd></dt>
                          <dd>Focus pane left/right/up/down</dd>
                      </dl>
                      ',
                      :tags => "",
                      :visible => true
                    },
                    {
                      :id => "find",
                      :name => "Find",
                      :title => "Find",
                      :image => "",
                      :text => '
                      <dl>
                          <dt><kbd>⌘ + f</kbd></dt>
                          <dd>Find in file</dd>
                          <dt><kbd>⌘ + g</kbd></dt>
                          <dd>Find next</dd>
                          <dt><kbd>shift + ⌘ + f</kbd></dt>
                          <dd>Find in project</dd>
                          <dt><kbd>⌘ + e</kbd></dt>
                          <dd>Use selection for find</dd>
                      </dl>
                      ',
                      :tags => "",
                      :visible => true
                    },
                    {
                      :id => "folding",
                      :name => "Folding",
                      :title => "Folding",
                      :image => "",
                      :text => '
                      <dl>
                          <dt><kbd>ctrl + ⌘ + [ / ]</kbd></dt>
                          <dd>Fold/unfold current code block</dd>
                          <dt><kbd>option + shift + ⌘ + [ / ]</kbd></dt>
                          <dd>Fold/unfold all code blocks</dd>
                          <dt><kbd>⌘ + 1-9</kbd></dt>
                          <dd>*Fold code blocks at depth 1-9 *</dd>
                      </dl>
                      ',
                      :tags => "",
                      :visible => true
                    },
                    {
                      :id => "wordmanipulation",
                      :name => "Word Manipulation",
                      :title => "Word Manipulation",
                      :image => "",
                      :text => '
                      <dl>
                          <dt><kbd>ctrl + t</kbd></dt>
                          <dd>Transpose characters either side of cursor</dd>
                          <dt><kbd>option + backspace</kbd></dt>
                          <dd>Delete text to beginning of word</dd>
                          <dt><kbd>option + delete</kbd> or <kbd>fn + option + backspace</kbd></dt>
                          <dd>Delete text to end of word</dd>
                      </dl>
                      ',
                      :tags => "",
                      :visible => true
                    },
                    {
                      :id => "linemanipulation",
                      :name => "Line Manipulation",
                      :title => "Line Manipulation",
                      :image => "",
                      :text => '
                      <dl>
                          <dt><kbd>⌘ + ] / [</kbd></dt>
                          <dd>Indent/outdent current line</dd>
                          <dt><kbd>⌘ + enter</kbd></dt>
                          <dd>Insert new line after current line</dd>
                          <dt><kbd>⌘ + shift + enter</kbd></dt>
                          <dd>Insert new line before current line</dd>
                          <dt><kbd>ctrl + shift + k</kbd></dt>
                          <dd>Delete current line</dd>
                          <dt><kbd>ctrl + ⌘ + up/down</kbd></dt>
                          <dd>Move current line up/down</dd>
                          <dt><kbd>shift + ⌘ + d</kbd></dt>
                          <dd>Duplicate current line</dd>
                          <dt><kbd>⌘ + j</kbd></dt>
                          <dd>Join current and next lines</dd>
                      </dl>
                      ',
                      :tags => "",
                      :visible => true
                    },
                    {
                      :id => "selection",
                      :name => "Selection",
                      :title => "Selection",
                      :image => "",
                      :text => '
                      <dl>
                          <dt><kbd>⌘ + d</kbd></dt>
                          <dd>Select current word/token</dd>
                          <dt><kbd>⌘ + l</kbd></dt>
                          <dd>Select current line</dd>
                          <dt><kbd>option + shift + left/right</kbd></dt>
                          <dd>Select to beginning/end of word</dd>
                          <dt><kbd>shift + ⌘ + left/right</kbd></dt>
                          <dd>Select to first/last character of line</dd>
                          <dt><kbd>shift + ⌘ + up/down</kbd></dt>
                          <dd>Select to top/bottom of document</dd>
                      </dl>
                      ',
                      :tags => "",
                      :visible => true
                    },
                    ]
        }
      ]
  end

  def getCategory(categoryId)

    categories = categories()
    categories.each do |category|
      if category[:id] == categoryId
        return category
      end
    end
  end

  def getHomePage()
    categories = categories()
    return categories[0]
  end

  def getNextCategory(categoryId)
    categories = categories()
    count = categories.count - 1
    i = 0
    categories.each do |category|
      if category[:id] == categoryId
        if i == count
          return categories[0]
        else
          return categories[i+1]
        end
      end
      i = i + 1
    end
  end

  def getPrevCategory(categoryId)
    categories = categories()
    count = categories.count - 1
    i = 0
    categories.each do |category|
      if category[:id] == categoryId
        if i == 0
          return categories[count]
        else
          return categories[i-1]
        end
      end
      i = i + 1
    end
  end

  def getDict(name)
    dict.each do |entry|
      if entry[:name] == name
        return entry[:value]
      end
    end
  end

  def mode
    ENV["mode"]
  end

  #ENV["mode"] = "development"
  #ENV["mode"] = "production"

  # picture tag
  ENV["screen_xs"] = "300"
  ENV["screen_sm"] = "576"
  ENV["screen_sm_minus1"] = "575"
  ENV["screen_md"] = "720"
  ENV["screen_md_minus1"] = "719"
  ENV["screen_lg"] = "1140"
  ENV["screen_lg_minus1"] = "1139"

  # picture image paths and surffixes
  ENV["image_path"] = "static/img/content/"
  ENV["image_surffix_large"] = "-large"
  ENV["image_surffix_medium"] = "-medium"
  ENV["image_surffix_small"] = "-small"
  ENV["image_surffix_extrasmall"] = "-extrasmall"

end
