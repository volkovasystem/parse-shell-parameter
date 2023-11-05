"use strict";

/*;!
	@license:module:
		MIT License

		Copyright (c) 2023-present Richeve S. Bebedor <richeve.bebedor@gmail.com>

		@license:copyright:
			Richeve S. Bebedor

			<@license:year-range:2023-present;>

			<@license:contact-detail:richeve.bebedor@gmail.com;>
		@license:copyright;

		Permission is hereby granted, free of charge, to any person obtaining a copy
		of this software and associated documentation files (the "Software"), to deal
		in the Software without restriction, including without limitation the rights
		to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
		copies of the Software, and to permit persons to whom the Software is
		furnished to do so, subject to the following conditions:

		The above copyright notice and this permission notice shall be included in all
		copies or substantial portions of the Software.

		THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
		IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
		FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
		AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
		LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
		OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
		SOFTWARE.
	@license:module;
*/

const parseShellParameter = (
	function parseShellParameter( option ){
		(
				option
			=	(
						(
							option
						)
					||
						(
							{ }
						)
				)
		);

		const EMPTY_STRING = (
			""
		);

		const SHELL_PARAMETER_EQUATE_PATTERN = (
			/\=/
		);

		const SHELL_PARAMETER_PROPERTY_VALUE_NAMESPACE_PATTERN = (
			/^([a-z][a-z0-9]+\-)+[a-z0-9]+$/
		);

		const SHELL_PARAMETER_PROPERTY_PATTERN = (
			/^\-{1,2}/
		);

		const SHELL_PARAMETER_VALUE_LIST_PATTERN = (
			/\,/g
		);

		return	(
					Array
					.from(
						(
							new	Set(
									(
										process
										.argv
										.slice(
											(
												2
											)
										)
										.concat(
											(
												JSON
												.parse(
													(
															(
																process
																.env
																.npm_config_argv
															)
														||
															(
																"{}"
															)
													)
												)
												.remain
											)
										)
										.concat(
											(
												(
														(
															process
															.env
															.SHELL_PARAMETER
														)
													||
														(
															EMPTY_STRING
														)
												)
												.split(
													(
														" "
													)
												)
											)
										)
									)
								)
						)
					)
					.filter(
						(
							( argumentToken ) => (
									(
											typeof
											argumentToken
										==	"string"
									)
								&&
									(
											argumentToken
											.length
										>	0
									)
							)
						)
					)
					.reduce(
						function( argumentTokenList, argumentToken ){
							if(
									(
											SHELL_PARAMETER_EQUATE_PATTERN
											.test(
												(
													argumentToken
												)
											)
										===	true
									)
							){
								Array
								.prototype
								.splice(
									(
										argumentTokenList
									),

									(
										[
											(
												argumentTokenList
												.length
											),

											(
												0
											)
										]
										.concat(
											(
												argumentToken
												.split(
													(
														SHELL_PARAMETER_EQUATE_PATTERN
													)
												)
											)
										)
									)
								);
							}
							else{
								argumentTokenList
								.push(
									(
										argumentToken
									)
								);
							}

							return	(
										argumentTokenList
									);
						},

						(
							[ ]
						)
					)
					.reduce(
						function( shellParameter, argumentToken, index, argumentTokenList ){
							if(
									(
											SHELL_PARAMETER_PROPERTY_PATTERN
											.test(
												(
													argumentToken
												)
											)
										===	true
									)
							){
								const property = (
									argumentToken
									.replace(
										(
											SHELL_PARAMETER_PROPERTY_PATTERN
										),

										(
											EMPTY_STRING
										)
									)
								);

								const propertyVariableNamespace = (
										(
												(
														SHELL_PARAMETER_PROPERTY_VALUE_NAMESPACE_PATTERN
														.test(
															(
																property
															)
														)
													===	true
												)
										)
									?	(
											property
											.split(
												(
													/\-/g
												)
											)
											.map(
												(
													( propertyToken, index ) => (
															(
																	(
																			index
																		>	0
																	)
															)
														?	(
																`${ propertyToken[ 0 ].toUpperCase( ) }${ propertyToken.slice( 1 ).toLowerCase( ) }`
															)
														:	(
																propertyToken
																.toLowerCase( )
															)
													)
												)
											)
											.join(
												(
													""
												)
											)
										)
									:	(
											property
										)
								);

								const nextArgument = (
									argumentTokenList[ index + 1 ]
								);

								if(
										(
												SHELL_PARAMETER_PROPERTY_PATTERN
												.test(
													(
														nextArgument
													)
												)
											===	true
										)
								){
									(
											shellParameter[ property ]
										=	(
												true
											)
									);
								}
								else if(
										(
												SHELL_PARAMETER_VALUE_LIST_PATTERN
												.test(
													(
														nextArgument
													)
												)
											===	true
										)
								){
									(
											shellParameter[ property ]
										=	(
												nextArgument
												.split(
													(
														SHELL_PARAMETER_VALUE_LIST_PATTERN
													)
												)
											)
									);
								}
								else if(
										(
												typeof
												nextArgument
											!=	"undefined"
										)
								){
									(
											shellParameter[ property ]
										=	(
												nextArgument
											)
									);
								}
								else{
									(
											shellParameter[ property ]
										=	(
												true
											)
									);
								}

								if(
										(
												propertyVariableNamespace
											!==	property
										)
								){
									(
											shellParameter[ propertyVariableNamespace ]
										=	(
												shellParameter[ property ]
											)
									);
								}
							}

							return	(
										shellParameter
									);
						},

						(
							{ }
						)
					)
				);
	}
);

(
		module
		.exports
	=	(
			parseShellParameter
		)
);
