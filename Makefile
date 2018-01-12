# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vparis <vparis@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/10/02 17:37:24 by vparis            #+#    #+#              #
#    Updated: 2018/01/12 13:52:21 by vparis           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		=	libtpool.a
CC			=	gcc

SRCD		=	srcs
INCD		=	includes
LIBFTD		=	../libft

SRCS		=	$(SRCD)/tp_queue.c $(SRCD)/tp_thread.c \
				$(SRCD)/tp_pool.c $(SRCD)/tp_pool2.c
OBJS		=	$(patsubst %.c, %.o, $(SRCS))

CFLAGS		+=	-I$(LIBFTD)/includes -I$(INCD) -O2
LDFLAGS		+=	-Wall -Wextra -Werror -ansi -pedantic -Wno-unused-result
LDLIBS		+=

.PHONY: clean fclean re showlib

all: $(NAME)

$(NAME): $(OBJS)
	@ar rs $@ $(OBJS)
	@echo "libtpool - compiled"

%.o: %.c
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ -c $< $(LDLIBS)

showlib: $(NAME)
	@ar -t $(NAME)

clean:
	@rm -f $(OBJS)
	@echo "libtpool - objects cleaned"

fclean: clean
	@rm -f $(NAME)
	@echo "libtpool - lib cleaned"

__fclean:
	@rm -f $(NAME)
	@echo "libtpool - lib cleaned"

re: fclean all