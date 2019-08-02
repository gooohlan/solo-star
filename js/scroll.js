/*
 * Solo - A small and beautiful blogging system written in Java.
 * Copyright (c) 2010-present, b3log.org
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */
(function () {

    /**
     * @description 监听滚动高度，是否显示返回顶部
     */
    function myCustomFn(el) {
        if (el.mcs.top < -600) {
            if ($('#return-top').css('opacity') === '0') {
                $('#return-top').velocity('stop').velocity({opacity: 1}, {
                    duration: 500,
                    display: 'block'
                });
            }
        } else {
            $('#return-top').velocity('stop').velocity({opacity: 0}, {
                duration: 500,
                display: 'none'
            });
        }
    }

    /**
     * @description 阅读进度
     * @param el
     */
    function readPercent(el) {
        // console.log(el.mcs.content[0].offsetHeight);
        let percent = Math.round(-el.mcs.top / (el.mcs.content[0].offsetHeight - el.offsetHeight) * 100);
        $('.sidebar-toc-progress .progress-num').text(percent);
        $('.sidebar-toc-progress-bar').velocity('stop').velocity({width: percent + '%'}, {
            duration: 100,
            easing: 'easeInOutQuart'
        });
    }

    /**
     * @description 滚动到页面顶部
     */
    $('#return-top').on('click', function () {
        $('#content-outer').mCustomScrollbar('scrollTo', 'top', {
            scrollInertia: 1000,
            scrollEasing: 'easeInOut'
        });
    });

    /**
     * @description 滚动条修饰 - jquery 插件
     */
    $('#content-outer').mCustomScrollbar({
        theme: 'minimal',
        axis: 'y', // horizontal scrollbar
        callbacks: {
            whileScrolling: function () {
                myCustomFn(this);
                readPercent(this);
                findHeadPosition(this);
            },
            onScroll: function () {

            }
        }
    });
    $('#sidebar-toc-content').mCustomScrollbar({
        theme: 'minimal',
        axis: 'y', // horizontal scrollbar
        callbacks: {}
    });

    /**
     * @description menu link scroll to content
     */
    $('#sidebar .article__toc').find("li").find("a").on('click', function (e) {
        e.preventDefault();
        let _id = $(this).attr('href');
        $('#content-outer').mCustomScrollbar('scrollTo', _id, {
            scrollInertia: 500
        });
    });

    /**
     * @description 找到当前页面的位置，更改 active 目录
     * @param el
     */
    function findHeadPosition(el) {
        if ($('.article__toc').length === 0) {
            return
        }

        var $articleTocs = $('.vditor-reset [id^=b3_solo_h]'),
            $articleToc = $('.article__toc');

        $(window).unbind('scroll').scroll(function (event) {
            if ($('.article__toc li').length === 0) {
                return false;
            }

            // 界面各种图片加载会导致帖子目录定位
            var toc = [];
            $articleTocs.each(function (i) {
                toc.push({
                    id: this.id,
                    offsetTop: $(this).offset().top
                });
            });

            // 当前目录样式
            const menuHeight = $('header').innerHeight() + 3;
            for (var i = 0, iMax = toc.length; i < iMax; i++) {
                if (menuHeight < toc[i].offsetTop - 20) {
                    $articleToc.find('li').removeClass('current');
                    var index = i > 0 ? i - 1 : 0;
                    $articleToc.find('a[href="#' + toc[index].id + '"]').parent().addClass('current');
                    break;
                }
            }
            if (menuHeight >= toc[toc.length - 1].offsetTop - 20) {
                $articleToc.find('li').removeClass('current');
                $articleToc.find('li:last').addClass('current');
            }
        });

        $(window).scroll()
    }

    $('.toggle-sidebar-info span').on('click', function () {
        let toggleText = $(this).attr('data-toggle');
        $(this).attr('data-toggle', $(this).text());
        $(this).text(toggleText);
        if ($('#sidebar .author-info').is(':visible')) {
            $('#sidebar .author-info').velocity('stop').velocity({
                left: '80px',
                opacity: 0
            }, {
                duration: 300,
                display: 'none',
                easing: 'ease-in',
                complete: function () {
                    $('#sidebar .sidebar-toc').velocity('stop').velocity({
                        opacity: 1,
                        left: 0
                    }, {
                        duration: 500,
                        display: 'block',
                        easing: 'ease-out'
                    });
                }
            });
        } else {
            $('#sidebar .sidebar-toc').velocity('stop').velocity({
                opacity: 0,
                left: '-80px'
            }, {
                duration: 300,
                display: 'none',
                easing: 'ease-in',
                complete: function () {
                    $('#sidebar .author-info').velocity('stop').velocity({
                        left: '0px',
                        opacity: 1
                    }, {
                        duration: 500,
                        display: 'flex',
                        easing: 'ease-out'
                    });
                }
            });
        }
    });

}());