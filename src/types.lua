type Cleanup = () -> ()

export type Heartbeat = {
	Connect: (self: Heartbeat, callback: (deltaTime: number) -> ()) -> Disconnectable,
}

export type Disconnectable = {
	Disconnect: (self: Disconnectable) -> (),
}

export type Partial<T> = { [any]: any } & T

export type SpringOptions = {
	damping: number?,
	frequency: number?,
	mass: number?,
	tension: number?,
	friction: number?,
	position: number?,
	velocity: number?,
	impulse: number?,
	restingVelocity: number?,
	restingPosition: number?,
}

export type LinearOptions = {
	speed: number?,
} | number?

export type TweenOptions = {
	speed: number?,
	style: Enum.EasingStyle?,
	direction: Enum.EasingDirection?,
}

export type Motion<T = number> = {
	state: { [any]: MotionState },
	start: (self: Motion<T>) -> Cleanup,
	stop: (self: Motion<T>) -> (),
	get: (self: Motion<T>) -> T,
	getVelocity: (self: Motion<T>) -> T,
	set: (self: Motion<T>, value: T | { [any]: number }) -> (),
	patch: (self: Motion<T>, patch: { [any]: Partial<MotionState> }) -> (),
	impulse: (self: Motion<T>, impulse: T | { [any]: number }) -> (),
	to: (self: Motion<T>, goal: MotionSolver | { [any]: MotionSolver }) -> (),
	spring: (self: Motion<T>, goal: T, options: SpringOptions?) -> (),
	linear: (self: Motion<T>, goal: T, options: LinearOptions?) -> (),
	tween: (self: Motion<T>, goal: T, options: TweenOptions?) -> (),
	step: (self: Motion<T>, deltaTime: number) -> T,
	isComplete: (self: Motion<T>) -> boolean,
	onComplete: (self: Motion<T>, callback: (value: T) -> ()) -> Cleanup,
	onStep: (self: Motion<T>, callback: (value: T, deltaTime: number) -> ()) -> Cleanup,
	destroy: (self: Motion<T>) -> (),
}

export type MotionOptions = {
	heartbeat: Heartbeat?,
	start: boolean?,
}

export type MotionState = {
	value: number,
	complete: boolean,
	velocity: number?,
	destructor: (() -> ())?,
}

export type MotionSolver = (key: unknown, state: MotionState, deltaTime: number) -> ()

export type MotionGoal = { [any]: number } | number | UDim2 | UDim | Vector2 | Vector3 | Color3 | CFrame

return nil
