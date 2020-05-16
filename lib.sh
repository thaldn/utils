#!/bin/bash
#extracting command text_text_text_line options as parameters

help_info(){
    echo "NAME"
    echo "\t$0"
    echo "SYNOPSIS"
    echo "\t$0 is a shell test about process options"
    echo "DESCRIPTION"
    echo "\toption like -a -b param1 -c param2 -d"
}

if [ $# -lt 0 ]
then
    help_info
fi
nomal_opts_act()
{
    echo -e "\n### nomal_opts_act ###\n"

    while [ -n "$1" ]
    do
    case "$1" in 
        -a)
            echo "Found the -a option"
            ;;
        -b)
            echo "Found the -b option"
            echo "The parameter follow -b is $2" 
            shift
            ;;
        -c)
            echo "Found the -c option"
            echo "The parameter follow -c is $2"
            shift
            ;;
        -d)
            echo "Found the -d option"
            ;;
         *)
             echo "$1 is not an option"
            ;;
    esac
    shift
    done
}

#ÓÃshellÃüÁî×Ô½¨µÄÑ¡Ïî½âÎö£¬¿ÉÒÔ°´ÕÕ×Ô¼ºµÄÏë·¨ÊµÏÖ
#ÓÅµã£º×Ô¼º¶¨ÖÆ£¬Ã»ÓÐ×ö²»µ½£¬Ö»ÓÐÏë²»µ½
#È±µã£ºÂé·³

getopt_act()
{
    echo -e "\n### getopt_act ###\n"

    GETOPTOUT=`getopt ab:c:d "$@"`
    set -- $GETOPTOUT 
    while [ -n "$1" ] 
    do
    case $1 in 
        -a)
            echo "Found the -a option"
            ;;
        -b)
            echo "Found the -b option"
            echo "The parameter follow -b is "$2""
            shift
            ;;
        -c)
            echo "Found the -c option"
            echo "The parameter follow -c is "$2""
            shift
            ;;
        -d)
            echo "Found the -d option"
            ;;
        --)
            shift
            break
            ;;
         *)
             echo "Unknow option: "$1""
            ;;
    esac
    shift
    done

    param_index=1
    for param in "$@"
    do
        echo "Parameter $param_index:$param"
        param_index=$[ $param_index + 1 ] 
    done
}

#ÓÃgetoptÃüÁî½âÎöÑ¡ÏîºÍ²ÎÊý
#ÓÅµã£ºÏà¶ÔÓëgetoptsÀ´ËµÊÇ¸ö°ë×Ô¶¯½âÎö£¬×Ô¶¯×éÖ¯Ñ¡ÏîºÍ²ÎÊý£¬ÓÃ -- ·ûºÅ½«Ñ¡ÏîÓë²ÎÊý¸ô¿ª
#È±µã£ºÏà¶ÔÓÚgetoptsµÄÈ±µã
#1.ÐèÒªÓëset -- ÃüÁîÅäºÏ£¬²»ÊÇ±ØÐë£¬ÐèÒªÊÖ¶¯shift
#2.Ñ¡Ïî²ÎÊýÖÐ²»Ö§³Ö¿Õ¸ñÈç -a -b dog -c "earth moon" -d -f param1 param2 ¾Í»á½âÎö´íÎó

getopts_act()
{
    echo -e "\n### getopts_act ###\n"
    while getopts :ab:c:d ARGS
    do
    case $ARGS in 
        a)
            echo "Found the -a option"
            ;;
        b)
            echo "Found the -b option"
            echo "The parameter follow -b is $OPTARG"
            ;;
        c)
            echo "Found the -c option"
            echo "The parameter follow -c is $OPTARG"
            ;;
        d)
            echo "Found the -d option"
            ;;
         *)
             echo "Unknow option: $ARGS"
            ;;
    esac
    done

    shift $[ $OPTIND -1 ] 
    param_index=1
    for param in "$@"
    do
        echo "Parameter $param_index:$param"
        param_index=$[ $param_index + 1 ] 
    done
}

#getopts ÃüÁî½âÎöÑ¡ÏîºÍ²ÎÊý
#ÓÅµã£º¿ÉÔÚ²ÎÊýÖÐ°üº¬¿Õ¸ñÈç£º-c "earth moon"
#            Ñ¡Ïî×ÖÄ¸ºÍ²ÎÊýÖµÖ®¼ä¿ÉÒÔÃ»ÓÐ¿Õ¸ñÈç£º-bdog
#            ¿É½«Î´¶¨ÒåµÄÑ¡Ïî°ó¶¨µ½?Êä³ö
#            Unknow option: ?

#nomal_opts_act -a -b dog -c earth -d -f param1 param2
#getopts_act -a -b dog -c "earth moon" -d -f param1 param2
#getopt_act -a -b dog -c earth -d -f param1 param2
