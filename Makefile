# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fprovolo <fprovolo@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/09/04 15:27:16 by tvanessa          #+#    #+#              #
#    Updated: 2020/11/17 18:08:58 by fprovolo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = lem-in
S = 
SS = $(S)lem_in \
	$(S)get_data_input \
	$(S)new_data_inputlist \
	$(S)new_ways \
	$(S)parse_data \
	$(S)parse_links \
	$(S)bellma_ford \
	$(S)save_way \
	$(S)base_setting \
	$(S)run_lim_run \
	$(S)clean_data \
	$(S)tools \
	$(S)go_help

LFT_PATH = ./libft/
LIBFT = $(LFT_PATH)libft.a
OBJ_PATH = ./objects/
SRC = $(addsuffix .c, $(SS)))
OBJ = $(addprefix $(OBJ_PATH), $(addsuffix .o, $(SS)))

H = -I $(LFT_PATH)includes -I $(LFT_PATH) -I .
CC = clang
CF = -g -Wall -Wextra -Werror


.PHONY: all clean fclean re

all: $(NAME)

$(NAME): $(LIBFT) $(OBJ_PATH) $(OBJ)
	$(CC) $(CF) $(H) -o $(NAME) $(OBJ) -L$(LFT_PATH) -lft

$(LIBFT): $(LFT_PATH)*.c $(LFT_PATH)*.h
	make -C $(LFT_PATH)

$(OBJ_PATH):
	mkdir -p $(OBJ_PATH)

$(OBJ_PATH)%.o: %.c lem_in.h
	$(CC) $(CF) $(H) -c $< -o $@ 

clean:
	rm -rf $(OBJ_PATH)
	make -C $(LFT_PATH) clean

fclean: clean
	/bin/rm -f $(NAME)
	make -C $(LFT_PATH) fclean

re: fclean all
