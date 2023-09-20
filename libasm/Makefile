NAME = libasm.a

SRCS = src/ft_strcmp.s \
	   src/ft_strlen.s \
	   src/ft_strcpy.s \
	   src/ft_write.s \
	   src/ft_read.s \
	   src/ft_strdup.s

OBJS = ${SRCS:.s=.o}

CC		= nasm
FLAGS	= -f elf64

%.o: %.s
	${CC} ${FLAGS} $<

$(NAME): ${OBJS}
	ar rcs ${NAME} ${OBJS}

all: ${NAME}

clean:
	rm -f ${OBJS}

fclean:	clean
	rm -f ${NAME}

re: fclean all

.PHONY : all clean fclean re
