# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: frdescam <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/06/21 16:00:31 by frdescam          #+#    #+#              #
#    Updated: 2020/07/29 14:34:02 by frdescam         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a

SRCS = srcs/ft_strcmp.s srcs/ft_strlen.s srcs/ft_strcpy.s srcs/ft_write.s \
	   srcs/ft_read.s srcs/ft_strdup.s

OBJS = ${SRCS:.s=.o}

CC		= clang
NA		= nasm
RM		= rm -f

CFLAGS		= -g3
NASMFLAGS	= -f elf64

%.o:	%.s
		${NA} ${NASMFLAGS} $<

$(NAME): ${OBJS}
		ar rcs ${NAME} ${OBJS}

all:	${NAME}

clean:
		${RM} ${OBJS}

fclean:	clean
		${RM} ${NAME}
		${RM} test

re:		fclean all

test: fclean all
	${CC} ${CFLAGS} main.c ${NAME} -o test

.PHONY : all clean fclean re teset
